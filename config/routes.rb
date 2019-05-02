Rails.application.routes.draw do
	resources :bloggers
	resources :posts
	resources :destinations
	get '/posts/:id/liked_post', to: 'posts#liked_post', as: 'liked_post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
