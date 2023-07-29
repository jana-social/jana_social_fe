require 'rails_helper'

RSpec.describe User do
  it 'exists and has attributes' do
    attributes = {
      username: "schroederJerde",
      email: "schroederJerde@gmail.com",
      zipcode: "80301",
      street_address: "123 Main Street, New York, NY",
      bio: "Lorem ipsum dolor sit amet",
      likes: "consectetur adipiscing elit",
      dislikes: "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
      profile_image_link: "https://images.unsplash.com/photo-1543807535-eceef0bc6599?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
      latitude: "40.712776",
      longitude: "-74.005974"
    }

    user = User.new(attributes)

    expect(user).to be_a(User)
    expect(user.bio).to eq(attributes[:bio])
    expect(user.dislikes).to eq(attributes[:dislikes])
    expect(user.email).to eq(attributes[:email])
    expect(user.likes).to eq(attributes[:likes])
    expect(user.photo_url).to eq(attributes[:profile_image_link])
    expect(user.street_address).to eq(attributes[:street_address])
    expect(user.username).to eq(attributes[:username])
    expect(user.zipcode).to eq(attributes[:zipcode])
  end
end