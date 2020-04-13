class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories, dependent: :restrict_with_error

  validates :title, uniqueness: true
  validates :position, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: 1 }

  default_scope { ordered_by_position_asc }
  scope :ordered_by_position_asc, -> { order(position: :asc) }
end
