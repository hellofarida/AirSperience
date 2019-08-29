class Category < ApplicationRecord
  has_many :categorizings
  has_many :experiences, through: :categorizings

  validates :name, presence: true, uniqueness: true
end
