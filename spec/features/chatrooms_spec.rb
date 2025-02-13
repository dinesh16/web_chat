# frozen_string_literal: true

RSpec.describe 'Chatrooms', type: :feature do
  let!(:user) { create(:user) }

  context 'when no chatrooms have been created' do
    before do
      visit root_path

      fill_in 'Email',	with: user.email
      fill_in 'Password',	with: 'password123'

      click_button 'Log in'

      click_link('All Chatrooms')

      expect(current_path).to eq(chatrooms_path)
    end

    describe 'listing chatrooms' do
      it 'should have an empty message' do
        expect(page).to have_content('No chatrooms available')
      end
    end

    describe 'creating a new chatroom' do
      before do
        click_link('New Chatroom')

        expect(current_path).to eq(new_chatroom_path)
      end

      it 'should allow user to open the new form' do
        fill_in('Name', with: 'New Chatroom')

        click_button('Create')

        expect(current_path).to eq(chatroom_path(Chatroom.last))
        expect(page).to have_content('Chatroom created')

        click_link('Back')

        expect(current_path).to eq(chatrooms_path)
      end
    end
  end

  context 'when a chatroom has been created' do
    let!(:chatroom) { create(:chatroom) }

    before do
      visit root_path

      fill_in 'Email',	with: user.email
      fill_in 'Password',	with: 'password123'

      click_button 'Log in'

      click_link('All Chatrooms')

      expect(current_path).to eq(chatrooms_path)
    end

    describe 'listing chatrooms' do
      it 'should have a table of chatrooms' do
        expect(page).not_to have_content('No chatrooms available')

        expect(page).to have_content(chatroom.name)
      end
    end

    describe 'creating a new chatroom' do
      before do
        click_link('New Chatroom')

        expect(current_path).to eq(new_chatroom_path)
      end

      it 'should allow user to open the new form' do
        fill_in('Name', with: 'New Chatroom')

        click_button('Create')

        expect(current_path).to eq(chatroom_path(Chatroom.last))
        expect(page).to have_content('Chatroom created')

        click_link('Back')

        expect(current_path).to eq(chatrooms_path)
      end
    end

    describe 'joining chatroom' do
      it 'should allow a user to join a chatroom' do
        click_button('Join')

        expect(current_path).to eq(chatroom_path(chatroom))

        expect(page).to have_content('You have joined a new chatroom')
      end
    end
  end
end
