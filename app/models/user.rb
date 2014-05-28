class User < ActiveRecord::Base
  validates :yearOfBirth, numericality: { greater_than_or_equal_to: 1900, less_than_or_equal_to: ->(_) { Time.now.year},
                               only_integer: true }

  validates :username, uniqueness: true
end
