class BookRequestsController < ApplicationController
  load_and_authorize_resource
  before_action :set_book_request, only: %i[ edit update destroy ]

  # GET /book_requests or /book_requests.json
  def index
    @book_requests = BookRequest.all
  end

  # GET /book_requests/1 or /book_requests/1.json
  def show
    @book_requests =BookRequest.where(user_id:current_user.id )
  end

  # GET /book_requests/new
  def new
   
  end

  # GET /book_requests/1/edit
  def edit
  end

  # POST /book_requests or /book_requests.json
  def create
    if current_user.admin?
      flash[:alert] = "User not found."
    else
      @book_request = current_user.book_request.new(book_request_params)
      #byebug
      respond_to do |format|
        if @book_request.save
          @user=current_user
          UserMailer.with(user: @user,book_request: @book_request  ).new_book_request_email.deliver_now 
          format.html { redirect_to book_request_url(@book_request), notice: "Book request was successfully created." }
          format.json { render :show, status: :created, location: @book_request }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @book_request.errors, status: :unprocessable_entity }
        end
      end 
    end

  end

  # PATCH/PUT /book_requests/1 or /book_requests/1.json
  def update
    respond_to do |format|
      if @book_request.update(book_request_params)
        format.html { redirect_to book_request_url(@book_request), notice: "Book request was successfully updated." }
        format.json { render :show, status: :ok, location: @book_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_requests/1 or /book_requests/1.json
  def destroy
    @book_request.destroy
    @user=current_user
    UserMailer.with(user: @user,book_request: @book_request  ).cancle_book_request_email.deliver_now 

    respond_to do |format|
      format.html { redirect_to books_path, notice: "Book request was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def update_status  
    @user=current_user
    @book_request = BookRequest.find(params[:id])
    @book_request.update(status: params[:status])
    if @book_request.status.eql?("approved")
      UserMailer.with(user: @user,book_request: @book_request).approved_book_request_email.deliver_now 
    end
    redirect_to book_requests_path
  end
  def issued_book
    @approve_requests =BookRequest.where(status:"approved")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_request
      @book_request = BookRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_request_params
      #  params.fetch(:book_request, {})
      # params.require(:user_id, :book_id, :issue_date)
      # byebug
      params.require(:book_request).permit(:book_id, :request_date, :user_id)

    end
end