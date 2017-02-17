class ChangeAlarmContentToText < ActiveRecord::Migration
  def change
    change_column :alarms, :content, :text
  end
end
