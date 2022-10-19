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
        Article.create(
            title: 'Get Ready for the Big Chill', 
            content: 'Winter is coming, and Americans may get a cold shock when they get their heating bills, according to a report released last week by the U.S. Energy Information Administration (EIA) that deserves more attention. Bundle up and set your thermostat at 68 degrees, or prepare to pay a bundle.',
            author: 'The Editorial Board',
            category: 'Opinion',
            published_at: '2022-10-19T18:24:48+0000')
    end
end
