class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :sex
      t.integer :yearOfBirth
      t.string :handedness
      t.string :education

      t.timestamps
    end
  end
end
