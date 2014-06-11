class Testcase < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  has_many :testlogs
  has_many :results
end
