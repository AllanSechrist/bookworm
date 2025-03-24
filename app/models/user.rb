class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shelves
  has_many :ratings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, uniqueness: true
end
