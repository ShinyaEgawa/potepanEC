class Potepan::CategoriesController < ApplicationController
  def show
    @taxon = Spree::Taxon.find(params[:id])
    @taxonomies = Spree::Taxonomy.all.includes(:taxons)
    @products = filtered_products
    @option_types = Spree::OptionType.includes(:option_values).search_by_taxon(@taxon.self_and_descendants.ids) # rubocop:disable Metrics/LineLength
  end

private # rubocop:disable Layout/AccessModifierIndentation

  def filtered_products
    scope = Spree::Product.includes_price_image.in_taxon(@taxon)
    params[:option_value].present? ? scope.search_by_option_value(params[:option_value]) : scope
  end
end
