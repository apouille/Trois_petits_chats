require 'spec_helper'

feature "the sign in process" do
  background do
    @user = FactoryBot.create(:user)
  end

  scenario "signs me in" do
    
    visit '/users/sign_in'

    within(".row") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end

    click_button 'Log in'

    expect(page).to have_content 'Log out'
  end
end