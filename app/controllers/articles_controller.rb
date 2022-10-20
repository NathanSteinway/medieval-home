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

        render json: Article.find(params[:id]), :except => [:created_at, :updated_at]

    rescue ActiveRecord::RecordNotFound
        render status: :not_found
    end

    def not_allowed
        render status: :method_not_allowed
    end
    
    # Here I am staging a POST request to the server so it may receive a payload representing an article
    # When complete this will insert the article into the SQLite database if valid, as well as return the new object's info in JSON format as specified in the assignment's README.md
    def create

        # Article.create made an entry to SQLite db even if the data types were wrong
        # Documentation lead me to this...

        # You can assign Article to a variable and use .new, which makes a record but doesn't save it to SQLite db right away
        # Fixed article so that params may be added dynamically
        article = Article.new(article_params)

        # Documentation says that .save lets you return a success response if the new item saves properly
        
        if article.save
            render json: article, :except => [:created_at, :updated_at], status: :created

        # If it doesn't successfully pass, .errors lets you throw an error of your choice

        else
            render json: article.errors, status: :unprocessable_entity
        end
    end

    # For the purposes of this exercise a private method isn't really necessary but I came across it while reading documentation so hey why not
    # A little security never hurt anyone
    private

    # This makes it so that someone can't pass in whatever params they feel like
    # article variable will only accept title, content, author, category, and published_at as parameters
    def article_params
        params.permit(:title, :content, :author, :category, :published_at)
    end
end
