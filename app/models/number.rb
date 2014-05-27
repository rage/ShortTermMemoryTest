class Number < ActiveRecord::Base
  belongs_to :numberset
  validates :text, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 9,
                                    only_integer: true }
end
