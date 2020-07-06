class CreateUserShelves < ActiveRecord::Migration[6.0]
  def change
    create_table :user_shelves do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
