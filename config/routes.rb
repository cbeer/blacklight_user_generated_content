Rails.application.routes.draw do
  resources :user_generated_content, :only => [:index]
  resources :comments
  resources :tags
end
