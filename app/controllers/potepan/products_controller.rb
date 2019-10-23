class Potepan::ProductsController < ApplicationController
  MAX_RELATED_PRODUCTS = 4
  def show
    @product = Spree::Product.friendly.find(params[:id])
    @related_products = @product.related_products.limit(MAX_RELATED_PRODUCTS)
    @variant = @product.variants.first || @product.master
    if params[:taxon_id]
      @taxon = Spree::Taxon.find(params[:taxon_id])
    else
      @taxon = Spree::Taxon.first
    end
  end
end
