@cart_items.each do |cart_item|
    json.set! cart_item.id do
        json.extract! cart_item, :user_id, :product_id, :quantity, :id, :created_at, :updated_at
    end
end
