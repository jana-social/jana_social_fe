require "rails_helper"

RSpec.describe "Get all events" do
  describe "happy path" do
    before(:each) do
      events_response = File.read("spec/fixtures/get_all_events.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events")
        .to_return(status: 200, body: events_response)

      event_response = File.read("spec/fixtures/get_one_event.json")
      # stub_request(:get, "http://localhost:3000/api/v1/events/1")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events/1")
        .to_return(status: 200, body: event_response)


      user_response = File.read("spec/fixtures/user.json")
      authenticated_user = File.read("spec/fixtures/authenticated_user.json")

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
        .to_return(status: 200, body: user_response)

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
        .to_return(status: 200, body: authenticated_user)

      visit root_path
      fill_in :email, with: "stefanie@jaskolski-sanford.example"
      fill_in :password, with: "test"
      click_on "Log In"
      expect(current_path).to eq(dashboard_path(1))

      visit events_path
    end
    it "should return all events" do
      expect(current_path).to eq(events_path)

      expect(page.status_code).to eq(200)
      expect(page).to have_content("All Events")

      within("#event-1") do
        expect(page).to have_content("Title: Casey's Sweet Quiet Gathering")
        expect(page).to have_content("Description: Movie for people with noise senesitivities")
        expect(page).to have_content("Street Address: 5479 William Way, East Sonnyhaven, LA")
        expect(page).to have_content("Zipcode: 63637")
        expect(page).to have_content("Date/Time: 8-17-23, 5:25 PM")
        expect(page).to have_content("Private Status: true")
        expect(page).to have_content("Host: 1")
      end

      within("#event-2") do
        expect(page).to have_content("Title: Movie Title")
        expect(page).to have_content("Description: This is a movie")
        expect(page).to have_content("Street Address: 5479 William Way, Sonnyhaven, CO")
        expect(page).to have_content("Zipcode: 84674")
        expect(page).to have_content("Date/Time: 10-1-23, 6:00 PM")
        expect(page).to have_content("Private Status: false")
        expect(page).to have_content("Host: 6")
      end
    end

    it "displays links to each event" do
      expect(page).to have_link("Casey's Sweet Quiet Gathering")
      expect(page).to have_link("Movie Title")
      click_link("Casey's Sweet Quiet Gathering")

      expect(current_path).to eq(event_path(1))
    end

    it "displays link to User Dashboard" do
      expect(page).to have_link("View My Dashboard")
      click_link("View My Dashboard")
      expect(current_path).to eq(user_path(1))
    end

    xit "displays link to Create Event" do
      click_link("Create Event")
      expect(current_path).to eq(new_event_path)
    end
  end
end
