class User < ActiveRecord::Base
  validates :yearOfBirth, numericality: { greater_than_or_equal_to: 1900, less_than_or_equal_to: ->(_) { Time.now.year},
                               only_integer: true }

  validates :username, uniqueness: true

  has_many :testcases
  has_many :testlogs, :through => :testcases
  has_many :results, :through => :testcases
end
