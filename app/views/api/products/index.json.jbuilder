json.products do
    json.extract! @products, :id, :name, :price, :description, :specs :created_at, :updated_at
end
