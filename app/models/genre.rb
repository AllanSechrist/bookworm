class Genre < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :genre, presence: true
end
