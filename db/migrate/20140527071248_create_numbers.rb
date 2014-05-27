class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :numberset_id
      t.integer :position
      t.integer :text

      t.timestamps
    end
  end
end
