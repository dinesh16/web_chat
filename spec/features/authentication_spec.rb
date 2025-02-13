# frozen_string_literal: true

RSpec.describe 'Authentication', type: :feature do
  context 'with valid user' do
    let!(:user) { create(:user) }

    describe 'logging in' do
      before do
        visit root_path

        expect(current_path).to eq(new_user_session_path)
      end

      it 'should allow the user to log in with the correct details' do
        fill_in('Email', with: user.email)
        fill_in('Password', with: 'password123')

        click_button('Log in')
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Signed in successfully.')
      end

      # it 'should not allow the user to log in with the incorrect password' do
      #   fill_in('Email', with: user.email)
      #   fill_in('Password', with: 'notthepassword')

      #   click_button('Log in')

      #   expect(current_path).to eq(new_user_session_path)
      #   expect(page).to have_content('Invalid Email or password.')
      # end

      # it 'should not allow the user to log in with the incorrect email' do
      #   visit root_path

      #   expect(current_path).to eq(new_user_session_path)

      #   fill_in('Email', with: 'noauser@test.net')
      #   fill_in('Password', with: 'password123')

      #   click_button('Log in')

      #   expect(current_path).to eq(new_user_session_path)
      #   expect(page).to have_content('Invalid Email or password.')
      # end
    end

    # describe 'sign up' do
    #   let!(:user) { create(:user) }

    #   before do
    #     visit root_path

    #     click_link('Sign up')

    #     expect(current_path).to eq(new_user_registration_path)
    #   end

    #   it 'should allow a new user sign up' do
    #     fill_in('Name', with: Faker::Name.name)
    #     fill_in('Email', with: Faker::Internet.unique.email)
    #     fill_in('Password', with: 'password123')
    #     fill_in('Password confirmation', with: 'password123')

    #     click_button('Sign up')

    #     expect(current_path).to eq(root_path)

    #     expect(page).to have_content('Welcome! You have signed up successfully.')
    #   end

    #   it 'should require a name' do
    #     fill_in('Email', with: Faker::Internet.unique.email)
    #     fill_in('Password', with: 'password123')
    #     fill_in('Password confirmation', with: 'password123')

    #     click_button('Sign up')

    #     expect(current_path).to eq('/users')

    #     expect(page).not_to have_content('Welcome! You have signed up successfully.')
    #     expect(page).to have_content("Name can't be blank")
    #   end

    #   it 'should require an email' do
    #     fill_in('Name', with: Faker::Name.name)
    #     fill_in('Password', with: 'password123')
    #     fill_in('Password confirmation', with: 'password123')

    #     click_button('Sign up')

    #     expect(current_path).to eq('/users')

    #     expect(page).not_to have_content('Welcome! You have signed up successfully.')
    #     expect(page).to have_content("Email can't be blank")
    #   end

    #   it 'should require a password' do
    #     fill_in('Name', with: Faker::Name.name)
    #     fill_in('Email', with: Faker::Internet.unique.email)

    #     click_button('Sign up')

    #     expect(current_path).to eq('/users')

    #     expect(page).not_to have_content('Welcome! You have signed up successfully.')
    #     expect(page).to have_content("Password can't be blank")
    #   end

    #   it 'should require a unique email' do
    #     fill_in('Name', with: Faker::Name.name)
    #     fill_in('Email', with: user.email)
    #     fill_in('Password', with: 'password123')
    #     fill_in('Password confirmation', with: 'password123')

    #     click_button('Sign up')

    #     expect(current_path).to eq('/users')

    #     expect(page).not_to have_content('Welcome! You have signed up successfully.')
    #     expect(page).to have_content('Email has already been taken')
    #   end

    #   it 'should require a matching password and password_confirmation' do
    #     fill_in('Name', with: Faker::Name.name)
    #     fill_in('Email', with: Faker::Internet.unique.email)
    #     fill_in('Password', with: 'password123')
    #     fill_in('Password confirmation', with: 'password456')

    #     click_button('Sign up')

    #     expect(current_path).to eq('/users')

    #     expect(page).not_to have_content('Welcome! You have signed up successfully.')
    #     expect(page).to have_content("Password confirmation doesn't match Password")
    #   end

    #   it 'should allow the user to go back to the login page' do
    #     click_link('Log in')

    #     expect(current_path).to eq(new_user_session_path)
    #   end
    # end
  end
end
