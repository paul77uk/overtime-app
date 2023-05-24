require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page).to have_content('From the Homepage')
    end
  end
end
