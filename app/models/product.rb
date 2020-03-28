class Product < ApplicationRecord
  has_one_attached :picture #, service: :local
end
