class Potepan::ProductsController < ApplicationController
  def show
    @product = Spree::Product.friendly.find(params[:id])
    @variant = @product.variants.first || @product.master
  end
end
