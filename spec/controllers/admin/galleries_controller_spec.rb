require 'rails_helper'

RSpec.describe Admin::GalleriesController, type: :controller do
  let(:user) { User.first }
  let(:gallery) { create(:gallery, user: user) }

  login_user

  describe "GET 'index galleries'" do
    it 'loads index page' do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET 'show gallery'" do
    it 'loads show page' do
      expect do
        get :show, id: gallery.id
      end.to raise_error(ActionController::UrlGenerationError)
    end
  end

  describe "GET 'new gallery'" do
    it 'loads new page' do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET 'edit gallery'" do
    it 'loads edit gallery form' do
      get :edit, id: gallery.id
      expect(response).to be_success
    end
  end
end
