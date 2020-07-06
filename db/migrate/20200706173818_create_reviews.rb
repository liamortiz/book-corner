class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :book_id
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
