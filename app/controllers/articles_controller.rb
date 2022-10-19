class ArticlesController < ApplicationController
    def index
        #Instructs active record model to return all items in database in the form of JSON
        #Now that this is hooked up, this controller will return all items in the articles table.
        #Since there are no articles to return yet, this controller is returning an empty array.
        render json: Article.all
    end
    
    # Here I am staging a POST request to the server so it may receive a payload representing an article
    # When complete this will insert the article into the SQLite database if valid, as well as return the new object's info in JSON format as specified in the assignment's README.md
    def create
        # needs logic
    end
end
