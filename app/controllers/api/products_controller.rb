class Api::ProductsController < ApplicationController
    def index
        if params[:category]
            @products = Product.where(category: params[:category])
        else
            @products = Product.all
        end
        render 'api/products/index'
    end

    def show
        @product = Product.find_by(id: params[:id])
        if @product
            render 'api/products/show'
        else
            render json: {message: @product.errors.full_messages}, status: 422
        end
    end

    private

    def product_params
        params.require(:product).permit(:name, :category, :price, :description, :specs)
    end
end
