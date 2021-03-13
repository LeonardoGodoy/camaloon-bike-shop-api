class ProductSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at,
             :title, :description

  has_many :properties
end
