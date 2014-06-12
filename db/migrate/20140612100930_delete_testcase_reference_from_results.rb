class DeleteTestcaseReferenceFromResults < ActiveRecord::Migration
  def change
    remove_column :results, :testcase, :references
  end
end
