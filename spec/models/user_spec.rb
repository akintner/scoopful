require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = create(:user)
  end
  
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
  end

  context 'associciations' do
    it { should respond_to(:orders) }
  end

  context 'role' do
    it 'set to admin' do
      user = create(:user, role: 1)

      expect(user.role).to eq 'admin'
      expect(user.admin?).to be_truthy
    end

    it 'defaults to default' do
      user = create(:user)

      expect(user.role).to eq 'default'
      expect(user.admin?).to be_falsy
    end
  end

  context 'methods' do
    it 'concatenates first and last name' do
      expect(@user.name).to eq "#{@user.first_name} #{@user.last_name}"
    end

    it 'verifies user id' do
      id = @user.id
      expect(@user.verified?(id)).to be_truthy
      expect(@user.verified?(id - 1)).to be_falsy
    end

    it 'will sort orders by updated_at' do 
      @user = create(:user_with_orders)
      @user.orders << create(:order_with_items)

      first_item = @user.sorted_orders.first.updated_at
      second_item = @user.sorted_orders[1].updated_at

      expect(first_item).to be > second_item
    end
  end
end