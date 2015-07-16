class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :restaurantID
      t.string :email
      t.boolean :split

      t.timestamps
    end
  end
end
