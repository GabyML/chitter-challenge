require 'spec_helper'

feature 'User signs out' do

  before(:each) do
    User.create(email: 'test@test.com', username: 'someone',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    visit '/welcome'
    click_button 'Sign out'
    expect(page).to have_content('goodbye!') # where does this message go?
    expect(page).not_to have_content('Welcome, test@test.com')
  end
  
  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end


end