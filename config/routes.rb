Rails.application.routes.draw do
  match "user_generated_content/facet/:id", :to => 'user_generated_content#facet'
  resources :user_generated_content, :only => [:index]
  resources :comments
  resources :tags
end
