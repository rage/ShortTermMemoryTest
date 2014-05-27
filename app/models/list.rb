class List < ActiveRecord::Base
  has_many :numbersets, dependent: :destroy
end
