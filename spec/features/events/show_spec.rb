require 'rails_helper'

RSpec.describe 'Get one event', type: :feature do

  before(:each) do
    json_response = File.read("spec/fixtures/get_one_event.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events/1")
      .to_return(status: 200, body: json_response)
  end

  it 'displays one event' do

    # user_1 = User.create!(
    #   username: "Sweet Bread",
    #   email: "stefanie@jaskolski-sanford.example",
    #   password: "test",
    #   zipcode: "01417",
    #   street_address: "13575 Lavonda Ways",
    #   bio: "[\"Five dollar toast sriracha pop-up.\", \"Williamsburg austin mustache kombucha literally ennui pabst.\", \"Umami post-ironic direct trade.\", \"Sustainable diy park seitan pop-up selvage farm-to-table cold-pressed.\", \"Roof yolo blog.\"]",
    #   likes: "Gentrify roof hoodie mlkshk skateboard.",
    #   dislikes: "Lo-fi irony you probably haven't heard of them fingerstache tofu.",
    #   profile_image_link: "http://cummings-murphy.test/kim_hoppe"
    # )
    # @event = EventsFacade.new.get_one_event(1)

    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    # visit login_path

    # fill_in :username, with: @user1.username
    # fill_in :password, with: @user1.password

    # click_button "Login"
    # visit events_path

    visit '/events/1'

    expect(page).to have_content("Casey's Sweet Quiet Gathering")
    expect(page).to have_content("Movie for people with noise sensitivities")
    expect(page).to have_content("5479 William Way, East Sonnyhaven, LA")
    expect(page).to have_content("63637")
    expect(page).to have_content("8-17-23, 5:25 PM")
  end
end