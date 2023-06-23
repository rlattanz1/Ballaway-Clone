json.review do
    json.extract! @review, :rating, :title, :body, :product_id, :user_id, :id, :created_at, :updated_at
end
