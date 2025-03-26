class Shelf < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :books, dependent: :destroy

  validates :title, presence: true
end
