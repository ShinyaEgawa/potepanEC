require 'rails_helper'

RSpec.describe Potepan::ProductsController, type: :controller do
  render_views
  describe 'GET #show' do
    let!(:product) { create(:product) }

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

    it 'ページ名がpage_title - base_titleになっていること' do
      assert_select "title", "#{product.name} - BIGBAG Store"
    end
  end
end
