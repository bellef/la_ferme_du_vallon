# Join table between products and categories
class ProductCategory < ApplicationRecord
  belongs_to :product, inverse_of: :product_categories
  belongs_to :category, inverse_of: :product_categories

  validates :product_id, uniqueness: { scope: :category_id }
end
