class Genre < ApplicationRecord
  has_many :books

  validates :genre, presence: true
end
