Rails.application.routes.draw do
  scope :api do
    resources :posts, only: [:index, :create, :show, :update, :destroy]
  end
end
