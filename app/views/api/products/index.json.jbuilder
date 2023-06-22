@products.each do |product|
    json.set! product.id do
        json.extract! product, :id, :name, :price, :description, :specs, :created_at, :updated_at
    end
end
