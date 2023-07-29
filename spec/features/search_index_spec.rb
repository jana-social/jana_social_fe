require "rails_helper"

RSpec.describe "Search" do
  describe "Search Index" do
    before :each do
      visit search_index_path
    end
    it "has an Index page" do
      expect(page).to have_content("Find Friends")
    end

    it "has a Search Button" do
      expect(page).to have_button("Search")
    end

    xit "when you click 'Search' you are taken to the search show page" do
      click_on "Search"
      expect(current_path).to eq(search_path)
    end
  end
end