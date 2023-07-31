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

    it "has a Search field that takes you to Search Show" do
      fill_in "zipcode", with: "80301"
      fill_in "Search radius (miles)", with: "50"
      click_on "Search"
    end
  end
end