class Potepan::HomesController < ApplicationController
  MAX_NUMBER_NEW_PRODUCTS = 9
  MANY_POPULAR_TAXONS = ["shirts", "bags", "mugs"].freeze
  def index
    @new_products = Spree::Product.includes(master: [:default_price, :images]).order(available_on: "DESC").limit(MAX_NUMBER_NEW_PRODUCTS) # rubocop:disable Metrics/LineLength
    @popular_taxons = Spree::Taxon.search_by_names(MANY_POPULAR_TAXONS)
  end
end
