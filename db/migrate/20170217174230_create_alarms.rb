class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|

      t.timestamps null: false
    end
  end
end
