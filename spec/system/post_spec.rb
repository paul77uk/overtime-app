require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page).to have_content('Posts')
    end

    it 'has a list of posts' do
      FactoryBot.create(:post)
      FactoryBot.create(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page).to have_content('New')
    end

    it 'has a new form that can be reached' do
      fill_in 'post[date]',	with: Date.today
      fill_in 'post[rationale]',	with: 'Some Rational'
      click_on 'Save'

      expect(page).to have_content('Some Rational')
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]',	with: Date.today
      fill_in 'post[rationale]',	with: 'User Association'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end

  describe 'edit' do
    before { @post = FactoryBot.create(:post) }

    it 'can be reached by clicking edit on index page' do
      visit posts_path

      click_on("edit_#{@post.id}")
      expect(page).to have_content('Edit Page')
    end

    it 'can be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]',	with: Date.today
      fill_in 'post[rationale]',	with: 'Edited content'
      click_on 'Save'

      expect(page).to have_content('Edited content')
    end
  end
end
