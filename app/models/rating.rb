class Rating < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :user_id, uniqueness: { scope: :book_id }
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
