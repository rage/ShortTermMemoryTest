class CreateNumbersets < ActiveRecord::Migration
  def change
    create_table :numbersets do |t|
      t.integer :position
      t.integer :list_id
      t.integer :length
      t.string :order

      t.timestamps
    end
  end
end
