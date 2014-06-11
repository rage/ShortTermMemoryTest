class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :testcase, index: true
      t.string :keypressed
      t.integer :keypressindex
      t.integer :last_series
      t.integer :timestamp

      t.timestamps
    end
  end
end
