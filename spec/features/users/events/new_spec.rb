require "rails_helper"

RSpec.describe "New Event Form" do
  describe "Create a new event form" do
    it "redirects to Oauth authentication page" do
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
      expect(page).to have_link("Create New Event")
    end

    it "Displays for fields and buttons" do
      visit new_user_event_path(1)

      expect(page).to have_field(:title)
      expect(page).to have_content("Title")

      expect(page).to have_field(:description)
      expect(page).to have_content("Description")

      expect(page).to have_field(:street_address)
      expect(page).to have_content("Street address")

      expect(page).to have_field(:city)
      expect(page).to have_content("City")

      expect(page).to have_field(:state)
      expect(page).to have_content("State")

      expect(page).to have_field(:zipcode)
      expect(page).to have_content("Zipcode")

      expect(page).to have_field(:date_time)
      expect(page).to have_content("Date time")

      expect(page).to have_unchecked_field(:private)
      expect(page).to have_content("Private")

      expect(page).to have_button("Create Event")
    end
  end
end
