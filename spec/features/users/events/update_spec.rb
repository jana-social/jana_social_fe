require "rails_helper"

RSpec.describe "Update Event Form" do
  it "Shows edit form" do
    json_response_event = File.read("spec/fixtures/get_one_event.json")

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events/1")
      .to_return(status: 200, body: json_response_event, headers: {})

    visit event_edit_path(1, 1)
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

    expect(page).to have_button("Update Event")
  end
end
