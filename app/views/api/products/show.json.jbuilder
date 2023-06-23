json.product do
    json.extract! @product, :id, :name, :price, :description, :specs. :reviews :created_at, :updated_at
    json.photoUrl product.photos.attatched? ? product.photos.url : nil
    json.imageUrls product.images.map { |file| file.url }
end

json.reviews do
    @product.reviews.each do |review|
        json.set! review.id do
            json.extract! review, :rating, :title, :body, :product_id, :user_id, :id, :created_at, :updated_at
        end
    end
end
