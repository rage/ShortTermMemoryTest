class AddTestcaseIdColumnToResults < ActiveRecord::Migration
  def change
    add_column :results, :testcase_id, :integer
  end
end
