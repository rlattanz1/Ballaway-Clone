class Api::ProductsController < ApplicationController
    def index
        if params[:category]
            categories = params[:category].split(',')
            product_ids = nil
            categories.each do |category|
                category_products = Product.where('category LIKE ?', "%#{category}%").pluck(:id)
                product_ids = product_ids.nil? ? category_products : product_ids & category_products
            end
            @products = Product.where(id: product_ids)
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
