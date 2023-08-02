require "rails_helper"

RSpec.describe "Get all events" do
  describe "happy path" do
    before(:each) do
      json_response = File.read("spec/fixtures/get_all_events.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events")
        .to_return(status: 200, body: json_response)
    end
    it "should return all events" do
      visit events_path
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
        # consider removing some of this, it is almost the same as the show page
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

    xit "displays links to each event" do
      # Create Event to click on
      click_link(@event1.title.to_s)
      expect(current_path).to eq(event_path(@event1.id))
    end

    xit "displays link to User Dashboard" do
      click_link("User Dashboard")
      expect(current_path).to eq(login_path)
    end

    xit "displays link to Create Event" do
      click_link("Create Event")
      expect(current_path).to eq(new_event_path)
    end
  end
end
