class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties, id: :uuid do |t|
      t.references :category, null: true, foreign_key: true, type: :uuid
      t.references :product, null: true, foreign_key: true, type: :uuid
      t.string :title
      t.jsonb :values

      t.timestamps
    end
  end
end
