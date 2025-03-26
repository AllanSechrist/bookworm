class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  belongs_to :genre
  has_many :ratings, dependent: :destroy
  has_and_belongs_to_many :shelves, dependent: :destroy

  validates :title, :isbn, presence: true
  validate :isbn_length_valid

  private

  def isbn_length_valid
    return if isbn.blank?

    unless[10, 13].include?(isbn.length)
      errors.add(:isbn, "ISBN must be either 10 or 13 characters long")
    end
  end
end
