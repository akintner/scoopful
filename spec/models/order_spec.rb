require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'associations' do
    it { should belong_to :user }
    # it { should have_many :items, through: :order_items }
    # it { should have_many :order_items }
  end
end