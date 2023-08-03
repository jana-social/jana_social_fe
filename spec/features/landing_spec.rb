require "rails_helper"

RSpec.describe "/", type: :feature do
  before(:each) do
    visit root_path
  end

  it "will allow a user to log in" do
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=&q=")
      .to_return(status: 200, body: "", headers: {})

    expect(page).to have_button("Log In")
    expect(page).to_not have_link("Log Out", href: logout_path)
    expect(page).to_not have_link("Dashboard")
    find_field(:email)
    find_field(:password)
    expect(page).to have_link("Create New User", href: new_user_path)
  end

  it "will allow a user to log in" do
    authenticated_user = File.read("spec/fixtures/authenticated_user.json")
    json_response = File.read("spec/fixtures/user.json")

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
      .to_return(status: 200, body: json_response)

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
      .to_return(status: 200, body: authenticated_user, headers: {})

    fill_in :email, with: "stefanie@jaskolski-sanford.example"
    fill_in :password, with: "test"

    click_button("Log In")

    expect(current_path).to eq(dashboard_path(1))
  end

  it "will take a user to create a new account" do
    click_on("Create New User")
    response = File.read("spec/fixtures/created_user.json")
    stub_request(:post, "https://jana-social-be.onrender.com/api/v1/users/").
    with(
      body: {"email"=>"test3@test.com", "password"=>"test", "username"=>"test3", "zipcode"=>"80301"},
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Content-Type'=>'application/x-www-form-urlencoded',
      'User-Agent'=>'Faraday v2.7.10'
      }).
    to_return(status: 200, body: response , headers: {})
    expect(current_path).to eq(new_user_path)

    fill_in :username, with: "test3"
    fill_in :email, with: "test3@test.com"
    fill_in :password, with: "test"
    fill_in :zipcode, with: "80301"

    click_on "Create New Account"
    expect(current_path).to eq(root_path)

  end

  it "will allow a user to visit dashboard and log out after logging in" do
    json_response = File.read("spec/fixtures/authenticated_user.json")
    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
      .to_return(status: 200, body: json_response, headers: {})

    stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
      .to_return(status: 200, body: json_response, headers: {})

    expect(page).to_not have_content("Log Out")
    expect(page).to_not have_content("Dashboard")

    fill_in :email, with: "stefanie@jaskolski-sanford.example"
    fill_in :password, with: "test"
    click_on "Log In"

    visit root_path

    expect(page).to have_content("Log Out")
    expect(page).to have_content("Dashboard")

    click_on "Log Out"

    expect(current_path).to eq(root_path)
  end

  context "sad path" do
    it "won't allow a user to login with the wrong credentials" do
      response = { "errors": ["Invalid username or password"] }
      json_response = response.to_json
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=testy&q=stefanie@jaskolski-sanford.example")
        .to_return(status: 200, body: json_response, headers: {})

      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
        .to_return(status: 200, body: json_response, headers: {})

      fill_in :email, with: "stefanie@jaskolski-sanford.example"
      fill_in :password, with: "testy"
      click_on "Log In"

      expect(page).to have_content("Sorry, your credentials are invalid.")
      expect(current_path).to eq(root_path)
    end
  end
end
