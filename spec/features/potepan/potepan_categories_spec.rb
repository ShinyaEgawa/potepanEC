require 'rails_helper'

RSpec.feature "Potepan::Categories", type: :feature do
  let!(:taxon) { create(:taxon, taxonomy: taxonomy) }
  let!(:taxonomy) { create(:taxonomy) }
  let!(:product) { create(:product, taxons: [taxon]) }

  before do
    visit potepan_category_path(id: taxon.id)
  end

  scenario 'カテゴリーページが正しく表示されていること' do
    expect(page).to have_content taxon.name
    expect(page).to have_content product.name
    expect(page).to have_content product.display_price
  end

  scenario 'サイドバーが正しく表示されていること' do
    within ".side-nav" do
      expect(page).to have_content taxonomy.name
    end
  end

  scenario 'カテゴリーページから商品詳細ページへ移動すること' do
    expect(page).to have_link product.name
    click_on product.name
    expect(current_path).to eq potepan_product_path(product.id)
  end

  scenario 'タイトルがカテゴリ名+サイト名となっていること' do
    expect(page).to have_title("#{taxon.name} - BIGBAG Store")
  end
end
