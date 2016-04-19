require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'associations' do
    it { is_expected.to respond_to(:gallery) }
    it { is_expected.to respond_to(:image) }
    it { is_expected.to respond_to(:link) }
  end

  describe 'validations' do
    context 'should be valid' do
      it { expect(build(:photo)).to be_valid }
    end

    context 'shouldn\'t be valid' do
      it('with empty image') { expect(build(:photo, image: nil)).to_not be_valid }
      it('with invalid link format') { expect(build(:photo, link: 'bad format')).to_not be_valid }
    end
  end
end
