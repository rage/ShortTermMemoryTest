class Numberset < ActiveRecord::Base
  belongs_to :list
  has_many :numbers, dependent: :destroy
end
