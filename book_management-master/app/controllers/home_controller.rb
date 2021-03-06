# class HomeController < ApplicationController
#   def index
    
#     @users = User.where(admin: false)
#   end

#   def show
#   end

#   # GET /books/new
#   def new
#     @book = User.new
#   end

#   # GET /books/1/edit
#   def edit
#   end

#   # POST /books or /books.json
#   def create
#     @user = User.new(user_params)

#     respond_to do |format|
#       if @user.save
#         format.html { redirect_to user_url(@user), notice: "User was successfully created." }
#         format.json { render :show, status: :created, location: @user }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /books/1 or /books/1.json
#   def update
#     respond_to do |format|
#       if @user.update(user_params)
#         format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
#         format.json { render :show, status: :ok, location: @user }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /books/1 or /books/1.json
#   def destroy
#     @user.destroy

#     respond_to do |format|
#       format.html { redirect_to users_url, notice: "User was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_book
#       @user = User.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def user_params
#       params.require(:user).permit(:name, :email, :password, :password_conformation)
#     end
# end
