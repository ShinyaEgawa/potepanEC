require 'rails_helper'

RSpec.feature "Potepan::Homes", type: :feature do
  let!(:popular_taxon) { create(:taxon, name: "Bags") }
  let!(:taxon) { create(:taxon) }
  let!(:new_product) { create(:product, taxons: [taxon]) }

  before do
    visit potepan_root_path
  end

  scenario '人気カテゴリーからカテゴリーページへ移動すること' do
    expect(page).to have_link popular_taxon.name
    click_on popular_taxon.name
    expect(current_path).to eq potepan_category_path(popular_taxon.id)
  end

  scenario '新着商品から商品ページへ移動すること' do
    expect(page).to have_link new_product.name
    click_on new_product.name
    expect(current_path).to eq potepan_product_path(new_product.id)
  end

  scenario '新着商品が正しく表示されていること' do
    expect(page).to have_content new_product.name
    expect(page).to have_content new_product.display_price
  end

  scenario 'タイトルロゴからrootへ移動すること' do
    within ".navbar-brand" do
      expect(current_path).to eq potepan_root_path
    end
  end

  scenario 'navbarの"HOME"からrootへ移動すること' do
    expect(page).to have_link "HOME"
    click_on "HOME"
    expect(current_path).to eq potepan_root_path
  end

  scenario 'タイトルがサイト名となっていること' do
    expect(page).to have_title("BIGBAG Store")
  end
end
