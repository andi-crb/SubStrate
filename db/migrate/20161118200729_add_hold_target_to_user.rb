class AddHoldTargetToUser < ActiveRecord::Migration
  def change
    add_column :users, :hold_target, :integer
  end
end
