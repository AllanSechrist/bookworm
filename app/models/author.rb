class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
