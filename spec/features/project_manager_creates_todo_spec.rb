require 'spec_helper'

feature 'Project manager creates TODO' do
  scenario 'Successfully' do 
    visit new_list_path 
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Your new List was saved')
    expect( page ).to have_content('Meet up with the team')
  end
end

 
  # PM goes to the TODO creation page
  # PM submits new TODO description
  # PM sees confirmation message
  # PM sees newly saved TODO