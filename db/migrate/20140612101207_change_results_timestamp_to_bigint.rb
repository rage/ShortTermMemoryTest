class ChangeResultsTimestampToBigint < ActiveRecord::Migration
  def change
    change_column :results, :timestamp, :bigint
  end
end
