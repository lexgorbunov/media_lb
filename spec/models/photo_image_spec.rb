require 'rails_helper'

RSpec.describe Photo::Image, type: :model do
  describe 'associations' do
    it { is_expected.to respond_to(:owner) }
    it { is_expected.to respond_to(:file) }
    it { is_expected.to respond_to(:file_file_name) }
  end

  describe 'validations' do
    context 'should be valid' do
      it { expect(build(:photo_image)).to be_valid }
    end
  end
end
