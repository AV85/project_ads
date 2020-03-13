require 'rails_helper'

describe "the sign_in process", type: :feature, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category) }

  context "when user sign_up" do
    it "should be success" do
      visit '/users/sign_up'
      within("#new_user") do
        fill_in 'Email', with: 'user@email.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        fill_in 'First name', with: FFaker::Name.first_name
        fill_in 'Last name', with: FFaker::Name.last_name
      end
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(current_path).to eq root_path
    end

    it "should be fail" do
      visit '/users/sign_up'
      within("#new_user") do
        fill_in 'Email', with: 'user@email.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password123'
        fill_in 'First name', with: FFaker::Name.first_name
        fill_in 'Last name', with: FFaker::Name.last_name
      end
      click_button 'Sign up'
      expect(page).to have_content 'Password confirmation doesn\'t match Password'
    end
  end

  context "when user sign_in" do
    it "should be success" do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
      expect(current_path).to eq root_path
    end

    it "should be fail" do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', with: 'noemailuser@email.com'
        fill_in 'Password', with: 'fail_pass'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end
end
