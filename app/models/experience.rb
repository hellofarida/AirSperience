class Experience < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :bookings
  has_many :categorizings
  has_many :categories, through: :categorizings
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true, null: false
  validates :description, presence: true, null: false
  validates :price, presence: true, null: false, numericality: { only_integer: true }
  validates :picture_url, null: false
  validates :photo, presence: true
  validates :categories, presence: true

  accepts_nested_attributes_for :categories

  mount_uploader :photo, PhotoUploader

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [:title],
                  associated_against: {
                    category: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
