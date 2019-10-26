require 'rails_helper'

RSpec.describe Potepan::HomesController, type: :controller do
  describe 'index Actionが成功すること' do
    let!(:new_product) { create_list(:product, 9, available_on: Time.current) }
    let!(:unnew_peoduct) { create(:product, available_on: 2.month.ago) }
    let!(:popular_taxon) { create(:taxon, name: "Bags") }
    let!(:unpopular_taxon) { create(:taxon, name: "T-Shirts") }

    before do
      get :index
    end

    it '正常にレスポンスを返すこと' do
      expect(response).to be_successful
    end

    it 'indexテンプレートを描画すること' do
      expect(response).to render_template :index
    end

    it '@new_productsが9つ表示されていること' do
      expect(assigns(:new_products).count).to eq 9
    end

    it '@new_productsに古い商品が描画されていないこと' do
      expect(assigns(:new_products)).not_to contain_exactly unnew_peoduct
    end

    it '@pupular_taxonの配列の個数と内容が正しいこと' do
      expect(assigns(:popular_taxons)).to contain_exactly popular_taxon
    end
  end
end
