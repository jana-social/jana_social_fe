require "rails_helper"

RSpec.describe "/logout", type: :feature do
  context "happy path" do
    it "will allow a user to log out" do
      json_response = File.read("spec/fixtures/authenticated_user.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
        .to_return(status: 200, body: json_response, headers: {})

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
        .to_return(status: 200, body: json_response, headers: {})

      visit root_path

      fill_in :email, with: "stefanie@jaskolski-sanford.example"
      fill_in :password, with: "test"
      click_on "Log In"

      expect(current_path).to eq(dashboard_path(1))

      click_on "Log Out"

      expect(current_path).to eq(root_path)
    end
  end
end
