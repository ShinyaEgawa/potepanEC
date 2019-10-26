require 'rails_helper'

RSpec.describe Potepan::CategoriesController, type: :controller do
  describe 'show Actionが成功すること' do
    let!(:taxon) { create(:taxon, taxonomy: taxonomy) }
    let!(:taxonomy) { create(:taxonomy) }
    let!(:product) { create(:product, taxons: [taxon]) }
    let!(:other_product) { create(:product) }

    before do
      get :show, params: { id: taxon.id }
    end

    it '正常なレスポンスを返すこと' do
      expect(response).to be_successful
    end

    it 'showテンプレートを描画すること' do
      expect(response).to render_template :show
    end

    it '@taxonが期待される値を持っていること' do
      expect(assigns(:taxon)).to eq(taxon)
    end

    it '@taxonomyの配列の個数と内容が正しいこと' do
      expect(assigns(:taxonomies)).to contain_exactly taxonomy
    end

    it '@productの配列の個数と内容が正しいこと' do
      expect(assigns(:products)).to contain_exactly product
    end

    it 'other_productが@productに含まれていないこと' do
      expect(assigns(:products)).not_to include other_product
    end
  end
end
