require 'rails_helper'

describe Api::V1::ProductsController, type: :controller do


  describe 'GET #index' do
    before(:each) do
      4.times { FactoryGirl.create :product }
      get :index
    end

    it 'returns records from the database as json array' do
      products_response = json_response
      expect(products_response).to be_a Array
    end

    it { should respond_with 200 }
  end


  describe 'GET #show' do
    before(:each) do
      @product = FactoryGirl.create :product
      get :show, id: @product.id
    end

    it 'returns the information about product as a hash' do
      product_response = json_response
      expect(product_response[:title]).to eql @product.title
    end

    it { should respond_with 200 }
  end

end
