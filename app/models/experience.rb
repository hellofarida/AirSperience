class Experience < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  validates :title, presence: true, uniqueness: true, null: false
  validates :description, presence: true, uniqueness: true, null: false
  validates :price, presence: true, null: false, numericality: { only_integer: true }
  validates :picture_url, null: false, presence: true
end
