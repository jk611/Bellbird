class AddVotesToAlarm < ActiveRecord::Migration
  def change
    add_column :alarms, :votes, :integer
  end
end
