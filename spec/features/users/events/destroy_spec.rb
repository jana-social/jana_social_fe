require "rails_helper"

RSpec.describe "Delete Event" do
  xit "deletes an event" do
    json_delete_event = File.read("spec/fixtures/event_destroy.json")
    json_hosting_events = File.read("spec/fixtures/get_hosting_events.json")
    json_response_user = File.read("spec/fixtures/user.json")
    event_response = File.read("spec/fixtures/get_one_event.json")
    events_response = File.read("spec/fixtures/get_all_events.json")
    # authenticated_user = File.read("spec/fixtures/authenticated_user.json")

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=DawgTown@gmail.com")
    #   .to_return(status: 200, body: authenticated_user)

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events/1")
      .to_return(status: 200, body: event_response)

    stub_request(:delete, "https://jana-social-be.onrender.com/api/v1/users/1/events/1")
      .to_return(status: 204, body: json_delete_event)

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1/events/hosting")
      .to_return(status: 204, body: json_hosting_events)

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
      .to_return(status: 200, body: json_response_user)

    stub_request(:delete, "https://jana-social-be.onrender.com/api/v1/users/1/events/")
      .to_return(status: 200, body: events_response)


    visit root_path

    # fill_in :email, with: "DawgTown@gmail.com"
    # fill_in :password, with: "test"
    # click_on "Log In"

    fill_in :email, with: "stefanie@jaskolski-sanford.example"
    fill_in :password, with: "test"
    click_on "Log In"
    click_on "My Events"
    
    # visit event_edit_path(1, 1)

    # click_link("Delete Event")

    # expect(current_path).to eq(user_events_path(1))
    # expect(page).to have_content("Event successfully deleted")
  end
end