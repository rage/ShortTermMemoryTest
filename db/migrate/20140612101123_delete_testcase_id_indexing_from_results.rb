class DeleteTestcaseIdIndexingFromResults < ActiveRecord::Migration
  def change
    remove_index :results, column: :testcase_id
  end

end
