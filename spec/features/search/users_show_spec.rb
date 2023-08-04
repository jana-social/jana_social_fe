require "rails_helper"

RSpec.describe "User Show Page" do
  describe "A User's Profile with basic info" do
    before :each do
      json_response = File.read("spec/fixtures/authenticated_user.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
        .to_return(status: 200, body: json_response, headers: {})

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
        .to_return(status: 200, body: json_response, headers: {})

      json_response1 = File.read("spec/fixtures/users.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/")
        .to_return(status: 200, body: json_response1, headers: {})

      json_response2 = File.read("spec/fixtures/user_search_response.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1/find_friends?distance=0")
        .to_return(status: 200, body: json_response2, headers: {})

      json_response3 = File.read("spec/fixtures/user_search_result.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/2")
        .to_return(status: 200, body: json_response3, headers: {})

      stub_request(:get, "https://nominatim.openstreetmap.org/search?accept-language=en&addressdetails=1&format=json&q=01417").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }).to_return(status: 200, body: '[{"lat": "40.7128", "lon": "74.0060"}]', headers: {})

      visit root_path

      fill_in :email, with: "stefanie@jaskolski-sanford.example"
      fill_in :password, with: "test"
      click_on "Log In"
      click_on "Discover New Friends"
      # fill_in "Search radius (miles)", with: 20
      click_on "Search"
      click_link "Karl"
    end

    it "shows the user's info" do
      json_response4 = File.read("spec/fixtures/user_search_result.json")
      stub_request(:post, "https://jana-social-be.onrender.com/api/v1/friendships/")
        .to_return(status: 200, body: json_response4, headers: {})
      expect(page).to have_content("Karl")
      expect(page).to have_content("Where is my father")
      expect(page).to have_content("My father")
      expect(page).to have_content("self help books")
      click_on "Accept"
    end
  end
end
