class RemoveTimeFromSubmissions < ActiveRecord::Migration
  def change
    remove_column :submissions, :time
  end
end
