require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to respond_to(:galleries) }
  end

  describe 'validations' do
    context 'should be valid' do
      it { expect(create(:user)).to be_valid }
    end

    context 'shouldn\'t be valid' do
      it 'should not allow spaces in the email' do
        expect { create :user, email: 'any user@example.com' }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
