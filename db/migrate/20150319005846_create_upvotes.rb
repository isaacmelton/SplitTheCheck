class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
