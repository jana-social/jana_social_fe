require 'rails_helper'

RSpec.describe 'Get all events', type: :feature do
  describe 'happy path' do
    xit 'should return all events' do
      json_response = File.read('spec/fixtures/get_all_events.json')
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events").
        to_return(status: 200, body: json_response)
      visit '/api/v1/events'

      expect(page).to have_content("All Events")
      within("#event-1") do
        expect(page).to have_content("Title: ")
        expect(page).to have_content("Description: ")
        expect(page).to have_content("Street Address: ")
        expect(page).to have_content("Zipcode: ")
        expect(page).to have_content("Date Time: ")
        expect(page).to have_content("Private Status: ")
        expect(page).to have_content("Host: ")
      end

      expect(page.status_code).to eq(200)
    end
  end
end