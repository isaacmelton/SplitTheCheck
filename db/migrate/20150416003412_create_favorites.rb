class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.boolean :vote
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
