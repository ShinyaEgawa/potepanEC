Spree::Taxon.class_eval do
  def self.search_by_names(names_array)
    where(name: names_array)
  end
end
