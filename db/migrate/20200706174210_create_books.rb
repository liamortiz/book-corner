class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.text :title
      t.text :description
      t.text :authors
      t.datetime :published_date
      t.text :categories
      t.text :isbn
      t.integer :average_rating
      t.integer :ratings_count
      t.text :image_link

      t.timestamps
    end
  end
end
