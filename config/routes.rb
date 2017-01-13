Rails.application.routes.draw do
  resources :order do
    resources :feedback, only: [:index, :create, :new], controller: 'order_feedback'
  end
end
