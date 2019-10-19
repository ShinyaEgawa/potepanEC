class Potepan::ProductsController < ApplicationController
  def show
    @product = Spree::Product.friendly.find(params[:id])
    @variant = @product.variants.first || @product.master
    if params[:taxon_id]
      @taxon = Spree::Taxon.find(params[:taxon_id])
    else
      @taxon = Spree::Taxon.first
    end
  end
end
