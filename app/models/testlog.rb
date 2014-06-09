class Testlog < ActiveRecord::Base
  belongs_to :testcase


  validates :testcase_id, presence: true
  validates :eventtype, presence: true
  validates :timestamp, presence: true


end
