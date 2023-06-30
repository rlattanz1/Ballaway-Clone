json.product do
    json.extract! @product, :id, :name, :price, :description, :specs, :created_at, :updated_at
    json.photoUrl @product.photos.attached? ? @product.photos.map { |photo| photo.url} : nil
end


json.reviews do
    @product.reviews.each do |review|
        json.set! review.id do
            json.extract! review, :rating, :title, :body, :value, :quality, :durability, :recommendation, :product_id, :user_id, :id, :created_at, :updated_at
            json.username review.user.username

        end
    end
end
