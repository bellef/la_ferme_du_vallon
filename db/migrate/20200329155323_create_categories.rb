class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title
    end

    create_table :product_categories do |t|
      t.references :product
      t.references :category
    end
  end
end
