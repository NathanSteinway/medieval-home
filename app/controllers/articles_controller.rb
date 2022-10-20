class ArticlesController < ApplicationController

    # index action is a GET request that returns a list of all specified items
    def index
        # Instructs active record model to return all items in database in the form of JSON
        # Now that this is hooked up, this controller will return all items in the articles table.
        # Since there are no articles to return yet, this controller is returning an empty array.
        # According to the documentation, you can make an order request at the controller level!
        render json: Article.all.order("published_at DESC"), :except => [:created_at, :updated_at]
    end

    # show action is a GET request that allows you to query a model by it's ID
    def show

        # DRY principles, simplified and included exception handling for created_at and updated_at
        render json: Article.find(params[:id]), :except => [:created_at, :updated_at]

    # This rescue catches an error and returns it as a 404
    rescue ActiveRecord::RecordNotFound
        render status: :not_found
    end

    # "handler" that interacts with delete/put/patch in routes.rb
    def not_allowed
        render status: :method_not_allowed
    end
    
    # Here I am staging a POST request to the server so it may receive a payload representing an article
    # When complete this will insert the article into the SQLite database if valid, as well as return the new object's info in JSON format as specified in the assignment's README.md
    def create

        params.require([:title, :content, :author, :category, :published_at])

        # Prevents title from exceeding 40 characters
        if params[:title].length > 40
            render status: :unprocessable_entity
            return
        end

        # You can assign Article to a variable and use .new, which makes a record but doesn't save it to SQLite db right away
        # Explicitly defining the params that go into this model
        article = Article.new do |a|
            a.title = params[:title]
            a.content = params[:content]
            a.author = params[:author]
            a.category = params[:category]
            a.published_at = params[:published_at]
        end

        # Documentation says that .save lets you return a success response if the new item saves properly
        
        if article.save
            render json: article, :except => [:created_at, :updated_at], status: :created

        # If it doesn't successfully pass, .errors lets you throw an error of your choice

        else
            render json: article.errors, status: :unprocessable_entity
        end
    
    # catches error and returns as 422
    rescue ActionController::ParameterMissing
        render status: :unprocessable_entity
    end
end
