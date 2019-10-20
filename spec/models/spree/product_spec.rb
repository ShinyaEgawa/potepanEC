require 'rails_helper'

RSpec.describe Spree::Product, type: :model do
  let!(:taxon) { create(:taxon) }
  let!(:product) { create(:product, taxons: [taxon]) }
  let!(:related_product) { create(:product, taxons: [taxon]) }

  it '@related_productの個数と内容が正しいこと' do
    expect(product.related_products).to contain_exactly(related_product)
  end
end
