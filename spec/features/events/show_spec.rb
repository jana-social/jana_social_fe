require "rails_helper"

RSpec.describe "Get one event", type: :feature do
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

    visit event_path(1)
  end

  it "displays one event" do
    
    expect(page).to have_content("Casey's Sweet Quiet Gathering")
    expect(page).to have_content("Movie for people with noise sensitivities")
    expect(page).to have_content("5479 William Way, East Sonnyhaven, LA")
    expect(page).to have_content("63637")
    expect(page).to have_content("8-17-23, 5:25 PM")
  end

  xit "displays buttons to My Events, User Dashboard, and Back to all Events" do

    expect(page).to have_link("My Events")
    click_link "My Events"
    expect(current_path).to eq(user_events_path(1))

    expect(page).to have_link("User Dashboard")
    click_link "User Dashboard"
    expect(current_path).to eq(user_path(1))

    expect(page).to have_link("Back to All Events")
    click_link "Back to All Events"
    expect(current_path).to eq(events_path)
  end
end
