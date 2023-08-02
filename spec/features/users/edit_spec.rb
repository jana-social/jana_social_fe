require 'rails_helper'

RSpec.describe "edit_user_path", type: :feature do
  describe "happy path" do
    it "edit user profile; upload new photo" do
      json_response = File.read("spec/fixtures/authenticated_user.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
        .to_return(status: 200, body: json_response, headers: {})

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
        .to_return(status: 200, body: json_response, headers: {})

    data = 
    {
      "id": "1",
      "type": "user",
      "attributes": {
        "username": "Sweet Bread",
        "email": "stefanie@jaskolski-sanford.example",
        "zipcode": "01417",
        "street_address": "13575 Lavonda Ways",
        "bio": "[\"Five dollar toast sriracha pop-up.\", \"Williamsburg austin mustache kombucha literally ennui pabst.\", \"Umami post-ironic direct trade.\", \"Sustainable diy park seitan pop-up selvage farm-to-table cold-pressed.\", \"Roof yolo blog.\"]",
        "likes": "Gentrify roof hoodie mlkshk skateboard.",
        "dislikes": "Lo-fi irony you probably haven't heard of them fingerstache tofu.",
        "profile_image_link": "http://cummings-murphy.test/kim_hoppe",
        "latitude": 9.191590386771395,
        "longitude": -29.227836572765966
      }
    }

      user = User.new(data)

      visit root_path

      fill_in :email, with: user.email
      fill_in :password, with: "test"
      click_on "Log In"

      expect(current_path).to eq(dashboard_path(1))
      expect(page).to have_content("Edit Profile")

      click_on "Edit Profile"
      expect(current_path).to eq(edit_user_path(1))

      expect(page).to have_content("Upload Photo")

      click_on "Upload Photo"
      expect(current_path).to eq(user_photo_edit_path(1))

      expect(page).to have_content("Upload New Photo")
      expect(page).to have_button("Upload Photo")

      new_profile_picture_path = Rails.root.join("spec/fixtures/new_profile_picture/shelby-hughes-chonkchilla.jpg")    # new_profile_picture_file = Rack::Test::UploadedFile.new(new_profile_picture_path, "image/jpeg")
    
      attach_file :file, new_profile_picture_path

      click_on "Upload Photo"
      expect(current_path).to eq(edit_user_path(1))
      expect(page).to have_content("Update Profile")
      
      click_on "Update Profile"
      expect(current_path).to eq(dashboard_path(1))
    end
  end
end