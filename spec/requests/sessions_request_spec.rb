require 'rails_helper'
require 'capybara/rspec'

describe 'Signing in', type: :feature do
  it 'tests if sign in is successful' do
    user = User.new(name: 'Murilo', email: 'murilo@gmail.com')
    user.save
    visit '/login'
    within('form') do
      fill_in 'session_name', with: 'Murilo'
    end
    click_button 'commit'

    expect(page).to have_content 'Welcome to Events planner, Murilo!'
  end
end

RSpec.describe 'Signing up', type: :system do
  describe 'signup page is showing the right fields' do
    it 'shows the username from signup page' do
      visit '/users/new'
      expect(page).to have_content 'Username'
    end
    it 'shows the email from signup page' do
      visit '/users/new'
      expect(page).to have_content 'E-mail'
    end
  end
end
