class AddPropertyCombinationToProductVersions < ActiveRecord::Migration[6.1]
  def change
    add_column :product_versions, :property_combination, :jsonb
  end
end
