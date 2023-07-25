@products.each do |product|
    json.set! product.id do
        json.extract! product, :id, :name, :price, :category, :description, :specs, :created_at, :updated_at
        json.photoUrl product.photos.attached? ? product.photos.map { |photo| photo.url} : nil
    end
end


