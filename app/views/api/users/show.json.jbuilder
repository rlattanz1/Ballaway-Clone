json.user do
    json.extract! @user, :id, :email, :username, :created_at, :updated_at
end

json.cart_items do
    @user.cart_items.each do |cart_item|
        json.set! cart_item.id do
            json.extract! cart_item, :user_id, :product_id, :quantity, :id, :created_at, :updated_at
            # json.username cart_item.user.username
        end
    end
end
