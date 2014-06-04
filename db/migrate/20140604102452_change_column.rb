class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :testlogs, :timestamp, :bigint
  end
end
