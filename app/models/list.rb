class List < ActiveRecord::Base
  has_many :numbersets, dependent: :destroy
  has_many :numbers,  :through => :numbersets
end
