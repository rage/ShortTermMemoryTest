class ChangeIntegerToBigint < ActiveRecord::Migration
  def change
    change_column :testlogs, :timestamp, :decimal
  end
end
