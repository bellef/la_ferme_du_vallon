class Product < ApplicationRecord
  has_one_attached :picture

  has_many :product_categories
  has_many :categories, through: :product_categories, dependent: :nullify

  validates :title, presence: true
  validates :price, presence: true
  validates :packaging, presence: true
  validates :categories, presence: true
  validates :origin, presence: true, allow_blank: false

  scope :in_category, -> (category_id) { joins(:categories).where(categories: { id: category_id }) }
end
