class CreateProductVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :product_versions, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.boolean :enabled

      t.timestamps
    end
  end
end
