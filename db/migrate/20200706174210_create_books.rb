class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :authors
      t.datetime :published_date
      t.string :categories 
      t.string :isbn
      t.integer :average_rating
      t.integer :ratings_count
      t.string :image_link

      t.timestamps
    end
  end
end
