require 'rails_helper'

RSpec.describe "/dashboard", type: :feature do
  context 'happy path' do
    it 'will display user dashboard' do
      json_response = File.read("spec/fixtures/user.json")
      authenticated_user = File.read("spec/fixtures/authenticated_user.json")

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
        .to_return(status: 200, body: json_response)

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/")
        .to_return(status: 200, body: json_response, headers: {})

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
        .to_return(status: 200, body: authenticated_user, headers: {})

      user = UserFacade.new.find_user(1)

      visit root_path
      fill_in :email, with: "stefanie@jaskolski-sanford.example"
      fill_in :password, with: "test"
      click_on "Log In"
      visit dashboard_path(user.id)

      expect(page).to have_content("#{user.username.to_s}'s Dashboard")
      expect(page).to have_content("Username: #{user.username.to_s}")
      expect(page).to have_content("Zipcode: #{user.zipcode.to_s}")
      expect(page).to have_content("Bio: #{user.bio.to_s}")
      expect(page).to have_content("What I like: #{user.likes.to_s}")
      expect(page).to have_content("What I try to stay away from: #{user.dislikes.to_s}")
      expect(page).to have_content("Profile Picture:")
      expect(page).to have_link("My Messages", href: user_rooms_path(user.id))
      expect(page).to have_link("Discover New Events", href: events_path)
      expect(page).to have_link("My Events", href: user_events_path(user.id))
      expect(page).to have_link("Discover New Friends", href: search_dashboard_path)
      expect(page).to have_link("My Friends", href: user_friends_path(user.id))
      expect(page).to have_link("Update My Profile Photo", href: edit_user_path(user.id))
    end
  end
end