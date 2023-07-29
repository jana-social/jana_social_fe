require "rails_helper"

RSpec.describe "Search" do
  describe "Search Dashbaord" do
    before :each do
      visit api_v1_search_dashboard_path
    end
    it "has an Dashboard page" do
      expect(page).to have_content("Find Friends")
    end

    it "has a Search field that takes you to Search Show" do
      fill_in "distance", with: "50"
      click_on "Search"
      expect(current_path).to eq(api_v1_search_index_path)
    end
  end
end