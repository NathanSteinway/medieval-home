class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    # This has created the table below, which may now be dynamically migrated to the database allowing stable interaction
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.string :author
      t.string :category
      t.date :published_at

      t.timestamps
    end
  end
end
