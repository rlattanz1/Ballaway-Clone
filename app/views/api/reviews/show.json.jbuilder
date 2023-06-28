    json.extract! @review, :rating, :title, :body, :value, :quality, :durability, :recommendation, :product_id, :user_id, :id, :created_at, :updated_at
    json.username @review.user.username
