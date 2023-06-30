@cart_items.each do |cart_item|
    json.set! cart_item.id do
        json.extract! cart_item, :user_id, :product_id, :quantity, :id, :created_at, :updated_at
        # json.productName cart_item.product.name, :name, :price, :
    end
end

# json.product do
#     @cart_items.each do |cart_item|
#         json.set! cart_item.product.id do
#             json.extract! product, :photoUrl, :name, :price, :id
#         end
#     end
# end
