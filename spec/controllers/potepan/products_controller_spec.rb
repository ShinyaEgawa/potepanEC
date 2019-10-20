require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do
  render_views
  describe 'GET #show' do
    let!(:taxon) { create(:taxon) }
    let!(:product) { create(:product, taxons: [taxon]) }
    let!(:related_products) { create_list(:product, 5, taxons: [taxon]) }

    before do
      get :show, params: { id: product.id }
    end

    it '正常にレスポンスを返すこと' do
      expect(response).to be_successful
    end

    it 'showテンプレートを描画すること' do
      expect(response).to render_template :show
    end

    it '@productが期待される値を持っていること' do
      expect(assigns(:product)).to eq product
    end

    it "@related_productsが4つ表示されていること" do
      expect(assigns(:related_products).count).to eq 4
    end

    it 'メインの商品が関連商品に表示されていないこと' do
      expect(assigns(:related_products)).not_to eq include product
    end
  end
end
