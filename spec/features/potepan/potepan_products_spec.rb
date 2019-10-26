require 'rails_helper'

RSpec.feature "Potepan::Products", type: :feature do
  let!(:taxon) { create(:taxon) }
  let!(:product) { create(:product, taxons: [taxon]) }
  let!(:related_product) { create(:product, taxons: [taxon]) }

  before do
    visit potepan_product_path(product)
  end

  scenario '商品詳細ページが正しく表示されること' do
    expect(page).to have_content product.name
    expect(page).to have_content product.description
    expect(page).to have_content product.display_price
  end

  scenario '関連商品が正しく表示されていること' do
    expect(page).to have_content related_product.name
    expect(page).to have_content related_product.display_price
  end

  scenario '関連商品から商品ページに移動すること' do
    expect(page).to have_link related_product.name
    click_on related_product.name
    expect(current_path).to eq potepan_product_path(related_product.id)
  end

  scenario '一覧ページへ戻るをクリックしたら一覧ページへ戻れること' do
    expect(page).to have_link "一覧ページへ戻る"
    click_on "一覧ページへ戻る"
    expect(current_path).to eq potepan_category_path(taxon.id)
  end

  scenario 'タイトルが商品名+サイト名となっていること' do
    expect(page).to have_title("#{product.name} - BIGBAG Store")
  end
end
