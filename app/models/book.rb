class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  belongs_to :genre
  has_and_belongs_to_many :shelves

  validates :title, :isbn, presence: true
end
