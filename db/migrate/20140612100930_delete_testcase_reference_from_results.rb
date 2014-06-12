class DeleteTestcaseReferenceFromResults < ActiveRecord::Migration
  def change
    remove_reference :results, :testcase, index: true
  end
end


