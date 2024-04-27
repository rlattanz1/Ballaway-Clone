class Api::CartItemsController < ApplicationController
    before_action :require_logged_in

    def index
        @cart_items = CartItem.all
        render :index
    end

    def create
        product_id = cart_items_params[:product_id]
        # setting the cart_items product_id param to a variable called product_id
        @cart_item = CartItem.find_by(product_id: product_id, user_id: current_user.id)
        # grabbing an instance of a cart_item by the product_id and user_id params
        if @cart_item
            #if the cart item already exists in the users cart
            @cart_item.quantity += 1
            # increment the quantity of the cart_item by one
            if @cart_item.save
                render :show #what is going on here why doesnt index work and show does even though I have deleted my show???
                # save the cart_item and render it here
            else
                render json: @cart_item.errors.full_messages, status: 422
                # render the error message if it does not save the cart_item
            end
        else
            @cart_item = CartItem.new(cart_items_params)
            # if the cart_item does not exist then create a new cart_item with the params being passed in
            @cart_item.user_id = current_user.id
            # set the user_id param of the cart_item to be the id of the current user
            if @cart_item.save
                render :show #what is going on here???
                # save the cart_item and render it here
            else
                render json: @cart_item.errors.full_messages, status: 422
                # render the error message if it does not save the cart_item
            end
        end
    end

    def update

        @cart_item = CartItem.find_by(id: params[:id])
        if @cart_item.update(cart_items_params) && @cart_item.user_id == current_user.id
            render :show #what is going on here???
        else
            render json: @cart_item.errors.full_messages, status: 422
        end
    end

    def destroy
        @cart_item = CartItem.find_by(id: params[:id])
        if @cart_item
            @cart_item.destroy
            render :show #what is going on here???
        else
            render json: {message: ['not a valid user cart item']}, status: 422
        end
    end

    private

    def cart_items_params
        params.require(:cart_item).permit(:user_id, :product_id, :quantity)
    end
end
