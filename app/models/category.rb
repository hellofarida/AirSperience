class Category < ApplicationRecord
  has_many :categorizings
  has_many :experiences, through: :categorizings

  validates :name, presence: true, uniqueness: true

  scope :featured, lambda { |number|
    select('categories.*')
      .joins(:categorizings)
      .having('count(*) >= ?', number)
      .order(Arel.sql('random()'))
      .limit(3)
      .group('categories.id')
  }
end
