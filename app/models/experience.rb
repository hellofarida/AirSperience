class Experience < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :reviews

  validates :title, presence: true, uniqueness: true, null: false
  validates :description, presence: true, null: false
  validates :price, presence: true, null: false, numericality: { only_integer: true }
  validates :picture_url, null: false
  validates :photo, presence: true, null: false

  mount_uploader :photo, PhotoUploader
end
