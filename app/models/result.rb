class Result < ActiveRecord::Base
  belongs_to :testcase
  has_one :user, through: :testcase
end
