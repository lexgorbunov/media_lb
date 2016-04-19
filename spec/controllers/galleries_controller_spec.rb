require 'rails_helper'

RSpec.describe GalleriesController, type: :controller do
  let(:user) { User.first }
  let(:not_published_gallery) { create(:gallery, is_published: false) }
  let(:published_gallery)     { create(:gallery, :with_photos, is_published: true) }

  login_user

  describe "GET 'show page'" do
    it 'not found not published collection' do
      expect do
        get :show, id: not_published_gallery.id
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "GET 'show page'" do
    it 'loads published collection' do
      get :show, id: published_gallery.id
      expect(response).to be_success
    end
  end
end
