class Product < ApplicationRecord
  has_one_attached :picture

  has_many :product_categories
  has_many :categories, through: :product_categories, dependent: :nullify

  validates :title, presence: true
  validates :price, presence: true
  validates :packaging, presence: true
end
