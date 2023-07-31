require 'rails_helper'

RSpec.describe 'Get one event', type: :feature do

  before(:each) do
    json_response = File.read("spec/fixtures/get_one_event.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events/1")
      .to_return(status: 200, body: json_response)
  end

  it 'displays one event' do

    # Commented out until we can figure out sessions / We need to login a user
    # visit login_path

    # fill_in :username, with: @user1.username
    # fill_in :password, with: @user1.password

    # click_button "Login"
    # visit events_path
    visit '/events/1'

    expect(page).to have_content("Casey's Sweet Quiet Gathering")
    expect(page).to have_content("Movie for people with noise sensitivities")
    expect(page).to have_content("5479 William Way, East Sonnyhaven, LA")
    expect(page).to have_content("63637")
    expect(page).to have_content("8-17-23, 5:25 PM")
    expect(page).to have_content("true")
  end
end