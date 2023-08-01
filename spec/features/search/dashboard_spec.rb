require "rails_helper"

RSpec.describe "Search" do
  describe "Search Dashbaord" do
    before :each do

      json_response = File.read("spec/fixtures/user.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
        .to_return(status: 200, body: json_response)

      @user = UserFacade.new.find_user(1)

      visit search_dashboard_path
    end

    it "has an Dashboard page" do
      expect(page).to have_content("Find Friends")
    end

    it "entering your zipcode and a search radius returns users within give search distance" do
      json_response = File.read("spec/fixtures/user_search_response.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/search").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.7.10'
        }).
      to_return(status: 200, body: json_response, headers: {})

      fill_in "zipcode", with: "80301"
      fill_in "Search radius (miles)", with: "50"
      click_on "Search"

      expect(current_path).to eq(search_results_path)

      expect(page).to have_content("Username")
      expect(page).to have_content("Likes")
    end
  end
end