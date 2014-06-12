class Result < ActiveRecord::Base
  belongs_to :testcase
  has_one :user, through: :testcase

  validates :testcase_id, presence: true
  validates :keypressed, presence: true
  validates :keypressindex, presence: true
  validates :last_series, presence: true
  validates :timestamp, presence: true
end
