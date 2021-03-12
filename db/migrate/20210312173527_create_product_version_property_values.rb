class CreateProductVersionPropertyValues < ActiveRecord::Migration[6.1]
  def change
    create_table :product_version_property_values, id: :uuid do |t|
      t.references :product_version, null: false, foreign_key: true, type: :uuid
      t.references :property, null: false, foreign_key: true, type: :uuid
      t.string :value

      t.timestamps
    end
  end
end
