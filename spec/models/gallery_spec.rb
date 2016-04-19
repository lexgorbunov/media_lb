require 'rails_helper'

RSpec.describe Gallery, type: :model do
  describe 'associations' do
    it { is_expected.to respond_to(:photos) }
    it { is_expected.to respond_to(:user) }
  end

  describe 'validations' do
    context 'should be valid' do
      it { expect(build(:gallery)).to be_valid }
    end

    context 'shouldn\'t be valid' do
      it('with empty user')   { expect(build(:gallery, user: nil)).to_not be_valid }
      it('with empty title')  { expect(build(:gallery, title: '')).to_not be_valid }
    end
  end
end
