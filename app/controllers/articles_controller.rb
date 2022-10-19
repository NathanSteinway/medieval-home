class ArticlesController < ApplicationController
    def index
        #Instructs active record model to return all items in database in the form of JSON
        #Now that this is hooked up, this controller will return all items in the articles table.
        #Since there is nothing in the database yet, this controller is returning an empty array.
        render json: Article.all
    end
end
