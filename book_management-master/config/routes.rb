Rails.application.routes.draw do
  root to: "books#index"
  resources :books
  devise_for :users
  resources :book_requests do
    member do
      patch :update_status
    end
  end
  #resources  :book_requests
  # get 'my_book_request', to: 'book_requests#show'
  # get 'issued_book', to: 'book_requests#issued_book'
   get 'book_request_path', to: 'book_requests#show'
end