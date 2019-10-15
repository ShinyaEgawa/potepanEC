class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @taxonomies = Spree::Taxonomy.all.includes(:taxons)
    @products = @taxon.products.includes(master: [:default_price, :images])
  end
end
