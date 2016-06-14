require 'spec_helper'

feature 'shows website history' do
	scenario 'displays a list of links on the homepage' do
		Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

		visit '/links'
		expect(page.status_code). to eq 200

		within 'ul#links' do
			expect(page).to have_content('Makers Academy')
		end 

	end 
end 