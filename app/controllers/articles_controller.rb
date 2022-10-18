class ArticlesController < ApplicationController
    def index
        #Instructs active record model to return all items in database in the form of JSON
        render json: Article.all
    end
end
