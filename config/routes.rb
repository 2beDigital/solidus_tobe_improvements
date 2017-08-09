Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :stores
  end
  namespace :admin do
	  resource :general_settings, only: [:edit, :update] do
	    post :testmail, on: :collection
	  end
	end
end