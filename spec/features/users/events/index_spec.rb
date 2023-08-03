require 'rails_helper'

RSpec.describe "User/Events Index Page" do
  before(:each) do
    hosting_response_event = File.read("spec/fixtures/get_hosting_events.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1/events/hosting")
      .to_return(status: 200, body: hosting_response_event)

    attending_response_event = File.read("spec/fixtures/get_attending_events.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1/events/attending")
      .to_return(status: 200, body: attending_response_event)

    events_response = File.read("spec/fixtures/get_all_events.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events")
      .to_return(status: 200, body: events_response)

    event_response = File.read("spec/fixtures/get_one_event.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events/1")
      .to_return(status: 200, body: event_response)

    user_response = File.read("spec/fixtures/user.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
      .to_return(status: 200, body: user_response)

    authenticated_user = File.read("spec/fixtures/authenticated_user.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
      .to_return(status: 200, body: authenticated_user)

    users_response = File.read("spec/fixtures/user.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
      .to_return(status: 200, body: users_response)
      visit root_path
      fill_in :email, with: "stefanie@jaskolski-sanford.example"
      fill_in :password, with: "test"
      click_on "Log In"
      
      visit user_events_path(1)
  end
  describe "hosting" do
    it "should return events that I am hosting" do
      
      expect(current_path).to eq(user_events_path(1))

      within "#hosting-events" do
        expect(page).to have_content("Casey's Sweet Quiet Gathering")
        expect(page).to have_content("Percy's Wild Journey")

        expect(page).to_not have_content("Casey's Sweet Loud Gathering")
        expect(page).to_not have_content("Movie Title")
      end

      expect(page).to have_link("Casey's Sweet Quiet Gathering")
      click_link "Casey's Sweet Quiet Gathering"
      
      expect(current_path).to eq(user_event_path(1, 1))
    end
  end

  describe "attending" do
    it "should return events that I am attending" do
      visit user_events_path(1)

      within "#attending-events" do
        expect(page).to have_content("Casey's Sweet Loud Gathering")
        expect(page).to have_content("Movie Title")

        expect(page).to_not have_content("Casey's Sweet Quiet Gathering")
        expect(page).to_not have_content("Percy's Wild Journey")
      end

      expect(page).to have_link("Casey's Sweet Loud Gathering")
      click_link "Casey's Sweet Loud Gathering"

      expect(current_path).to eq(event_path(1))
    end
  end

  describe "links in user events index" do
    it "should have links to create a new event" do
      expect(page).to have_link("Create New Event")
      # click_link "Create New Event"

      # expect(current_path).to eq(oauth_path)
      # cannot test yet, waiting on oauth
    end
  end
end