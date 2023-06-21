json.product do
    json.extract! @product, :id, :name, :price, :description, :specs :created_at, :updated_at
end
