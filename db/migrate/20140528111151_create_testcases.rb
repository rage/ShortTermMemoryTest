class CreateTestcases < ActiveRecord::Migration
  def change
    create_table :testcases do |t|
      t.integer :user_id
      t.integer :list_id
      t.boolean :training
      t.boolean :finished

      t.timestamps
    end
  end
end
