require 'rails_helper'

RSpec.describe User, type: :model do
  
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
  end

  context '#name' do
    it 'concatenates first and last name' do
      user = create(:user)

      expect(user.name).to eq "#{user.first_name} #{user.last_name}"
    end
  end
end