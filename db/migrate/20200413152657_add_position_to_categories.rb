class AddPositionToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :position, :integer

    reversible do |dir|
      dir.up do
        Category.reset_column_information
        Category.all.find_each.each_with_index do |category, index|
          category.update_attribute(:position, index + 1)
        end
      end
    end
  end
end
