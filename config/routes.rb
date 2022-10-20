Rails.application.routes.draw do
    # Resource Routing! The line below declares all necessary routes for any actions one may use. 10/18/2022
    # Here I've added a create action to the articles controller which will add a POST route to the API. 10/19/2022
    # My idea is that by doing this I will be able to call the create action and, since it's a POST request, change the state of the database by generating a new record and inserting it post-verification. 10/19/2022
    resources :articles, only: [:index, :show, :create]

    # Instead of including destory/edit/update in the above resources, I learned a DRY technique that allows me to write less code.
    # Instead of writing an action for each of these in articles_controller, I can instead write the below code and have it reference a handler in the controller.
    delete 'articles/:id', to: 'articles#not_allowed'
    put 'articles/:id', to: 'articles#not_allowed'
    patch 'articles/:id', to: 'articles#not_allowed'

end
