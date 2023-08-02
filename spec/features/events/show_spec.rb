require 'rails_helper'

RSpec.describe 'Get one event', type: :feature do

  before(:each) do
    # json_response = File.read("spec/fixtures/get_one_event.json")
    # stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events/1")
    #   .to_return(status: 200, body: json_response)
  end

  it 'displays one event' do
    json_auth = File.read("spec/fixtures/authenticated_user.json")
    json_events = File.read("spec/fixtures/get_all_events.json")
    json_user = File.read("spec/fixtures/user.json")
    json_event = File.read("spec/fixtures/get_one_event.json")
    json_users = File.read("spec/fixtures/users.json")

    # stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
    #   .to_return(status: 200, body: json_response, headers: {})

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
      .to_return(status: 200, body: json_user, headers: {})

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events")
      .to_return(status: 200, body: json_events, headers: {})

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events/1")
      .to_return(status: 200, body: json_event, headers: {})

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users")
      .to_return(status: 200, body: json_users, headers: {})

    # stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search_users")
    #   .to_return(status: 200, body: json_response, headers: {})

    # stub_request(:get, "https://jana-social-be.onrender.com/api/v1/user_search_response")
    #   .to_return(status: 200, body: json_response, headers: {})
      
    # stub_request(:get, "http://localhost:3000/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
    #   .to_return(status: 200, body: json_response, headers: {})

    visit root_path

    fill_in :email, with: "stefanie@jaskolski-sanford.example"
    fill_in :password, with: "test"
    click_on "Log In"
    
    visit '/events/1'

    expect(page).to have_content("Casey's Sweet Quiet Gathering")
    expect(page).to have_content("Movie for people with noise sensitivities")
    expect(page).to have_content("5479 William Way, East Sonnyhaven, LA")
    expect(page).to have_content("63637")
    expect(page).to have_content("8-17-23, 5:25 PM")
    save_and_open_page
  end
end