require 'rails_helper'


feature 'Creating a Poem (hint: make sure your capitalization is exact!)', type: :feature do
  context 'when logged in' do
    before :each do
      register_as_jack_bruce
      visit new_poem_url
    end

    it 'has a form to create a new poem' do
      expect(page).to have_content 'Create New Poem'
    end

    it 'takes a title and stanzas' do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Stanzas'
    end
    
    it 'has a radio button that allows a user to choose "true" if a poem is complete' do
      # Find all the radio buttons - there should only be 2
      radio_buttons = all('input[type=radio]', maximum: 2)
      # Finds the one radio button with the value of true
      true_button_array = radio_buttons.select{|input| input.value == "true"}
      expect(true_button_array).not_to be_empty
    end

    it 'has a radio button that allows a user to choose "false" if a poem is incomplete' do
      # Find all the radio buttons - there should only be 2
      radio_buttons = all('input[type=radio]', maximum: 2)
      # Finds the one radio button with the value of false
      false_button_array = radio_buttons.select{|el| el.value == "false"}
      expect(false_button_array).not_to be_empty
    end

    context 'on a successful save' do
      before :each do
        register_as_jack_bruce
        visit new_poem_url
        fill_in 'Title', with: 'Sunshine'
        fill_in 'Stanzas', with: 'Lovely flowers greet the sun, something something fun'
        choose(option: 'false')
        click_button 'Create Poem'
      end

      it 'redirects to the the poem index page' do
        expect(current_path).to eq(poems_path)
        expect(page).to have_content 'Sunshine'
      end
    end

    context 'on a failed save' do
      before :each do
        register_as_jack_bruce
        visit new_poem_url
        fill_in 'Stanzas', with: 'Sun in the afternoon, heading toward the moon'
        choose(option: 'false')
        click_button 'Create Poem'
      end

      it 'renders errors to the user' do
        expect(page).to have_content "Title can't be blank"
      end

      it 'prefills previously input information and still allows for a successful save' do
        fill_in 'Title', with: 'Sunshine'
        choose(option: 'false')
        click_button 'Create Poem'
        expect(page).to have_content 'Sunshine'
      end
    end
  end
end    

feature 'Editing an existing Poem (hint: make sure your capitalization is exact!)', type: :feature do
  context 'when logged in' do
    before :each do
      register_as_jack_bruce
      make_poem('Sunshine', 'lovely beams fall', 'true')
      click_link 'Edit Poem'
    end
    
    it 'has a form to edit an existing poem' do
      expect(page).to have_content 'Edit Poem Form'
    end

    it 'takes a title and stanzas' do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Stanzas'
    end
  end

  context 'on a successful update' do
    before :each do
      register_as_jack_bruce
      # make a poem named Sunshine
      make_poem('Sunshine', 'lovely beams fall', 'true')
      click_link 'Edit Poem'
      fill_in 'Title', with: 'Starshine'
      click_button 'Save Edited Poem'
    end

    it 'redirects to the poem index page and updates the poem\'s information' do
      expect(current_path).to eq(poems_path)
      expect(page).to have_content 'Starshine'
    end
  end

  context 'on a failed update' do
    before :each do
      register_as_jack_bruce
      # make a poem named Sunshine
      make_poem('Sunshine', 'lovely beams fall', 'true')
      click_link 'Edit Poem'
      fill_in 'Title', with: ''
      fill_in 'Stanzas', with: 'rainfall on my brain'
      click_button 'Save Edited Poem'
    end

    it 'renders errors to the user' do
      expect(page).to have_content "Something went wrong!"
    end

    it 'prefills information from a failed update and still allows for a successful update' do
      fill_in 'Title', with: 'Rainfall'
      click_button 'Save Edited Poem'
      expect(page).to have_content 'Rainfall'
    end
  end
end    
