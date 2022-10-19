class Article < ApplicationRecord
    Article.order(published_at: :desc)
end
