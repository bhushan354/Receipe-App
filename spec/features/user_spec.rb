require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :all do
    @user = User.create(name: 'new', email: 'new@gmail.com', password: '123123')
  end

  describe 'Login Page' do
    it 'displays a welcoming login page' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end

    it 'contains a user-friendly login form' do
      visit new_user_session_path
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    it 'allows successful login with valid credentials' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(current_path).to match('/')
    end

    it 'provides a link for users to sign up' do
      visit new_user_session_path
      expect(page).to have_content('Sign up')
    end

    it 'offers a convenient "Forgot your password" link' do
      visit new_user_session_path
      expect(page).to have_content('Forgot your password')
    end

    it 'navigates users to the password recovery page when clicked' do
      visit new_user_session_path
      click_link 'Forgot your password?'
      expect(current_path).to match(new_user_password_path)
    end

    it 'includes helpful text for users, such as "Remember me"' do
      visit new_user_session_path
      expect(page).to have_content('Remember me')
    end
  end

  describe 'Forgot Password Page' do
    it 'displays relevant content and a password recovery form' do
      visit new_user_password_path
      expect(page).to have_content('Log in')
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Forgot your password')
      expect(page).to have_content('Email')
    end
  end

  describe 'Sign Up Page' do
    it 'displays a welcoming sign-up page with a registration form' do
      visit new_user_registration_path
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Log in')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    it 'successfully signs up a user with valid credentials' do
      visit new_user_registration_path
      fill_in 'Name', with: 'John Doe'
      fill_in 'Email', with: 'john@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect(current_path).to match(%r{/users})
      expect(page).to have_content('Name can\'t be blank')
    end

    it 'displays appropriate error messages for invalid sign-up attempts' do
      visit new_user_registration_path
      fill_in 'Name', with: 'John Doe'
      fill_in 'Email', with: 'invalid_email'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
      expect(current_path).to eq(user_registration_path)
      expect(page).to have_content('Email is invalid')
    end
  end
end
