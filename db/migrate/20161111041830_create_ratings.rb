class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user
      t.integer :submission
      t.integer :rating

      t.timestamps null: false
    end
  end
end
