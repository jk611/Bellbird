class SetDefaultUpvote < ActiveRecord::Migration
  def change
    change_column :alarms, :votes, :integer, :default => 0
  end
end
