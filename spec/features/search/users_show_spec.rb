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
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1/find_friends?distance=20")
      .to_return(status: 200, body: json_response2, headers: {})

      visit root_path

      fill_in :email, with: "stefanie@jaskolski-sanford.example"
      fill_in :password, with: "test"
      click_on "Log In"
      click_on "Find New Friends"
      fill_in "Search radius (miles)", with: 20
      click_on "Search"
    end

    it "shows the user's info" do
      save_and_open_page
      expect(page).to have_content("Cheesecake")
      expect(page).to have_content("[\"Iphone pickled diy.\", \"Food truck put a bird on it distillery readymade chartreuse meh meditation.\", \"Cliche master mlkshk occupy ramps vice narwhal church-key.\", \"Keffiyeh mixtape tousled.\", \"Forage typewriter shabby chic gentrify.\"]")
      expect(page).to have_content("Stumptown skateboard aesthetic green juice.")
      expect(page).to have_content("Migas sriracha green juice yolo jean shorts narwhal muggle magic ramps kickstarter.")
    end
  end
end

