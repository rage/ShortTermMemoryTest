class AddTrainingToLists < ActiveRecord::Migration
  def change
    add_column :lists, :training, :boolean
  end
end
