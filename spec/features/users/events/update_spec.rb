require 'rails_helper'

RSpec.describe "Update Event Form" do
  it "redirects to Oauth authentication page" do
    user_id = 1
    json_response_hosting = File.read("spec/fixtures/get_hosting_events.json")
    json_response_attending = File.read("spec/fixtures/get_attending_events.json")
    json_response_user = File.read("spec/fixtures/user.json")

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/#{user_id}/events/hosting")
    .to_return(status: 200, body: json_response_hosting)

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/#{user_id}/events/attending")
    .to_return(status: 200, body: json_response_attending)

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/#{user_id}")
    .to_return(status: 200, body: json_response_user)

    visit edit_user_event(1)
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