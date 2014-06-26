class List < ActiveRecord::Base
  has_many :numbersets, dependent: :destroy
  has_many :numbers,  :through => :numbersets
  has_many :testcases
  has_many :testlogs, :through => :testcases
  has_many :results, :through => :testcases
end
