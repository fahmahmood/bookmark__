require 'spec_helper'

feature 'creates links' do
	scenario 'adds new links to the bookmark manager' do
		

		visit '/links/new'
		fill_in('url', with: 'www.qz.com')
		fill_in('title', with: 'Quartz')
		click_button('Create link')
		expect(current_path). to eq '/links'

		within 'ul#links' do
			expect(page).to have_content('Quartz')
		end 

	end 
end 