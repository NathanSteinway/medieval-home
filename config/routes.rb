Rails.application.routes.draw do
    #Resource Routing! The line below declares all necessary routes for any actions one may use.
    resources :articles, only: :index
end
