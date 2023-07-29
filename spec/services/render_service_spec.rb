require "rails_helper"

RSpec.describe RenderService do
  describe "users" do
    it "shows all users" do
      json_response = File.read("spec/fixtures/users.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users")
        .to_return(status: 200, body: json_response)

      results = RenderService.new.user_index
      expect(results).to be_a(Hash)

      users = results[:data]
      expect(users).to be_an(Array)

      users.each do |user|
        expect(user).to have_key(:id)
        expect(user[:id]).to be_a(String)

        expect(user).to have_key(:type)
        expect(user[:type]).to eq("user")

        expect(user).to have_key(:attributes)
        expect(user[:attributes]).to be_a(Hash)

        attributes = user[:attributes]

        expect(attributes).to have_key(:username)
        expect(attributes[:username]).to be_a(String)

        expect(attributes).to have_key(:email)
        expect(attributes[:email]).to be_a(String)

        expect(attributes).to have_key(:zipcode)
        expect(attributes[:zipcode]).to be_a(String)

        expect(attributes).to have_key(:street_address)
        expect(attributes[:street_address]).to be_a(String)

        expect(attributes).to have_key(:bio)
        expect(attributes[:bio]).to be_a(String)

        expect(attributes).to have_key(:likes)
        expect(attributes[:likes]).to be_a(String)

        expect(attributes).to have_key(:dislikes)
        expect(attributes[:dislikes]).to be_a(String)

        expect(attributes).to have_key(:profile_image_link)
        expect(attributes[:profile_image_link]).to be_a(String)

        expect(attributes).to have_key(:latitude)
        expect(attributes[:latitude]).to be_a(String)

        expect(attributes).to have_key(:longitude)
        expect(attributes[:longitude]).to be_a(String)
      end
    end
  end
end

      expect(events).to be_a(Hash) # switched from Array
      expect(events.first).to be_an(Array) # switched form Hash
      expect(events.first).to have_key(:title)
      expect(events.first.title).to be_a(String)
      expect(events.first).to have_key(:description)
      expect(events.first.description).to be_a(String)
      expect(events.first).to have_key(:street_address)
      expect(events.first.street_address).to be_a(String)
      expect(events.first).to have_key(:zipcode)
      expect(events.first.zipcode).to be_a(String)
      expect(events.first).to have_key(:date_time)
      expect(events.first.date_time).to be_a(String)
      expect(events.first).to have_key(:private_status)
      expect(events.first.private_status).to be_a(Boolean) # integer? 0, 1, 2
      expect(events.first).to have_key(:host)
      expect(events.first.host).to be_a(Integer)
    end
  end
end