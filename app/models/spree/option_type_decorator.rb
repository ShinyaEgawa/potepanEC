Spree::OptionType.class_eval do
  def self.search_by_taxon(taxon)
    if taxon.present?
      joins({ option_values: { variants: { product: :taxons } } }).
        where('spree_taxons': { id: taxon }).distinct
    else
      []
    end
  end
end
