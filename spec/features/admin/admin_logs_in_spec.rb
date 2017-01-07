require 'rails_helper'

RSpec.feature do 
  context 'admin logs in' do
    scenario 'redirected to admin dashboard' do
      admin = create(:user, role: 1)
      login_user(admin)

      expect(current_path).to eq admin_dashboard_path
    end
  end
end