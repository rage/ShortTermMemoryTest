class AddTestpathToTestcases < ActiveRecord::Migration
  def change
    add_column :testcases, :testpath, :string
  end
end
