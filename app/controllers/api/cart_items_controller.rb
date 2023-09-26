class Api::CartItemsController < ApplicationController
    before_action :require_logged_in, only: [:index, :show, :create]

    def index
        @cart_items = CartItem.all
        render :index
    end

    def show
        @cart_item = CartItem.find_by(:id)
        @cart_item.user_id = current_user.id
        if @cart_item
            render :show
        else
            render json: @cart_item.errors.full_messages, status: 422
        end 
    end

    def create
        product_id = cart_items_params[:product_id]
        @cart_item = CartItem.find_by(product_id: product_id, user_id: current_user.id)
        if @cart_item
            #if the cart item already exists in the users cart
            @cart_item.quantity += 1
            if @cart_item.save
                render :show
            else
                render json: @cart_item.errors.full_messages, status: 422
            end
        else
            @cart_item = CartItem.new(cart_items_params)
            @cart_item.user_id = current_user.id
            if @cart_item.save
                render :show
            else
                render json: @cart_item.errors.full_messages, status: 422
            end
        end
    end



    def update

        @cart_item = CartItem.find_by(id: params[:id])
        if @cart_item.update(cart_items_params) && @cart_item.user_id == current_user.id
            render :show
        else
            render json: @cart_item.errors.full_messages, status: 422
        end
    end

    def destroy
        @cart_item = CartItem.find_by(id: params[:id])
        if @cart_item
            @cart_item.destroy
            render :show
        else
            render json: {message: ['not a valid user cart item']}, status: 422
        end
    end

    private

    def cart_items_params
        params.require(:cart_item).permit(:user_id, :product_id, :quantity)
    end
end
