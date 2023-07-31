require "rails_helper"

RSpec.describe "User can log in" do
  it "can log in" do  
    visit root_path
    
    expect(page).to have_button("Log In")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")

    fill_in "Email", :with => "test@example.com"
    fill_in "Password", :with => "bubbles"

    click_button "Log In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Dashboard")
    
  end
end