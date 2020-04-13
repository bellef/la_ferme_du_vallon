class AddColumnsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :european_category, :string
    add_column :products, :origin, :string
    add_column :products, :is_ab_certified, :boolean, defaut: true
  end
end
