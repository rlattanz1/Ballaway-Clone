json.product do
    json.extract! @product, :id, :name, :price, :description, :specs :created_at, :updated_at
    json.photoUrl product.photos.attatched? ? product.photos.url : nil
    json.imageUrls product.images.map { |file| file.url }
end
