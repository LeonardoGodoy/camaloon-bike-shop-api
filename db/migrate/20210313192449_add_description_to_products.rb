class AddDescriptionToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :description, :string
  end
end
