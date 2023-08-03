require "rails_helper"

RSpec.describe "Get one event", type: :feature do
  before(:each) do
    json_response = File.read("spec/fixtures/get_one_event.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events/1")
      .to_return(status: 200, body: json_response)
  end

  it "displays one event" do
    json_response = File.read("spec/fixtures/get_one_event.json")
    stub_request(:get, "http://localhost:3000/api/v1/events/1")
      .to_return(status: 200, body: json_response)

    json_response_search = File.read("spec/fixtures/search_users.json")
    stub_request(:get, "http://localhost:3000/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
      .to_return(status: 200, body: json_response_search, headers: {})
    json_response_user = File.read("spec/fixtures/user.json")
    stub_request(:get, "http://localhost:3000/api/v1/users/1")
      .to_return(status: 200, body: json_response_user, headers: {})
    json_response_events = File.read("spec/fixtures/get_all_events.json")
    stub_request(:get, "http://localhost:3000/api/v1/events")
      .to_return(status: 200, body: json_response_events, headers: {})

    visit "/events/1"

    expect(page).to have_content("Casey's Sweet Quiet Gathering")
    expect(page).to have_content("Movie for people with noise sensitivities")
    expect(page).to have_content("5479 William Way, East Sonnyhaven, LA")
    expect(page).to have_content("63637")
    expect(page).to have_content("8-17-23, 5:25 PM")
  end
end
