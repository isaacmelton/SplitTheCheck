class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
