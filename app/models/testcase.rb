class Testcase < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  has_many :testlogs
end
