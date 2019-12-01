Spree::Product.class_eval do
  scope :includes_price_image, -> { includes(master: [:default_price, :images]) }

  def self.search_by_option_value(option_value)
    joins(variants: :option_values).where(spree_option_values: { id: option_value })
  end

  def related_products
    Spree::Product.in_taxons(taxons).includes(master: [:default_price, :images]).where.not(id: id).distinct # rubocop:disable Metrics/LineLength
  end
  # Spree::Product.none
end
