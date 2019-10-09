require 'rails_helper'

RSpec.feature "Potepan::Products", type: :feature do
  scenario '商品詳細ページが正しく表示されること' do
    product = create(:product_in_stock)

    visit potepan_product_path(product)
    expect(page).to have_content product.name
    expect(page).to have_content product.description
    expect(page).to have_content product.display_price
  end
end
