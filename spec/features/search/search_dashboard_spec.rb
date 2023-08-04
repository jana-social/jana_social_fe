require "rails_helper"

RSpec.describe "Search" do
  describe "Search Dashbaord" do
    before :each do
      json_response = File.read("spec/fixtures/authenticated_user.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
        .to_return(status: 200, body: json_response, headers: {})

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
        .to_return(status: 200, body: json_response, headers: {})

      json_response1 = File.read("spec/fixtures/users.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/")
        .to_return(status: 200, body: json_response1, headers: {})

      visit root_path

      fill_in :email, with: "stefanie@jaskolski-sanford.example"
      fill_in :password, with: "test"
      click_on "Log In"
    end

    it "has an Dashboard page" do
      expect(page).to have_content("Discover New Friends")
      click_on "Discover New Friends"
      expect(current_path).to eq(search_dashboard_path)
      expect(page).to have_content("Discover New Friends")
    end

    it "entering search radius returns users within your area" do
      visit search_dashboard_path

      distance = 50
      user_id = 1

      json_response2 = File.read("spec/fixtures/user_search_response.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/#{user_id}/find_friends?distance=#{distance}")
        .to_return(status: 200, body: json_response2, headers: {})

      fill_in "Search radius (miles)", with: distance
      click_on "Search"

      expect(current_path).to eq(search_results_path)

      expect(page).to have_content("Username")
      expect(page).to have_content("Likes")
    end
  end
end
