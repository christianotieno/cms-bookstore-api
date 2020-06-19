# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookController, type: :controller do
  let(:valid_attributes) do
    {
      title: 'American Pie',
      author: 'John Doe',
      category: 'category'
    }
  end

  let(:invalid_attributes) do
    { title: nil }
    { category: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      book = create(:book)
      get :show, params: { id: book.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Book' do
        expect do
          post :create, params: { book: valid_attributes }
        end.to change(Book, :count).by(1)
      end

      it 'returns a 201 status code' do
        post :create, params: { book: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Book' do
        expect do
          post :create, params: { book: invalid_attributes }
        end.to change(Book, :count).by(0)
      end

      it 'returns a 422 status code' do
        post :create, params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested book' do
      book = create(:book)
      expect do
        delete :destroy, params: { id: book.to_param }
      end.to change(Book, :count).by(-1)
    end
  end
end
