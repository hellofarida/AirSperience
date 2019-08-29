class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :experiences, foreign_key: :owner_id
  has_many :bookings, foreign_key: :renter_id

  has_many :favourites, foreign_key: :favoruite_id

  has_many :reviews, foreign_key: :review_id

  validates :email, presence: true, uniqueness: true
end
