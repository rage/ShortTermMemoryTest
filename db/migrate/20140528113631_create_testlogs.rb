class CreateTestlogs < ActiveRecord::Migration
  def change
    create_table :testlogs do |t|
      t.integer :testcase_id
      t.string :eventtype
      t.string :value
      t.integer :timestamp

      t.timestamps
    end
  end
end
