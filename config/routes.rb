Rails.application.routes.draw do
    #Resource Routing! The line below declares all necessary routes for any actions one may use. 10/18/2022
    #Here I've added a create action to the articles controller which will add a POST route to the API. 10/19/2022
    #My idea is that by doing this I will be able to call the create action and, since it's a POST request, change the state of the server by generating a new record. 10/19/2022
    resources :articles, only: [:index, :create]
end
