require "rails_helper"

RSpec.describe RenderService do
  context "users" do
    context "class methods" do
      describe "::user_index" do
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
            expect(attributes[:latitude]).to be_a(Float)

            expect(attributes).to have_key(:longitude)
            expect(attributes[:longitude]).to be_a(Float)
          end
        end
      end

      describe "::user_show" do
        it "returns a specific user" do
          json_response = File.read("spec/fixtures/user.json")
          stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
            .to_return(status: 200, body: json_response)

          result = RenderService.new.user_show(1)

          expect(result).to be_a(Hash)

          user = result[:data]
          expect(user).to be_a(Hash)

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
          expect(attributes[:latitude]).to be_a(Float)

          expect(attributes).to have_key(:longitude)
          expect(attributes[:longitude]).to be_a(Float)
        end
      end

      describe "::authenticate_with" do
        context "happy path" do
          it "creates a users" do
            user_params = {
              username: "test3",
              email: "test3@test.com",
              password: "test",
              zipcode: "80301"
            }

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
              to_return(status: 200, body: response, headers: {})

            result = RenderService.new.create_user("/api/v1/users/", user_params)

            expect(result).to be_a(Hash)

            user = result[:data]
            expect(user).to be_a(Hash)

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
            expect(attributes[:street_address]).to be(nil)

            expect(attributes).to have_key(:bio)
            expect(attributes[:bio]).to be(nil)

            expect(attributes).to have_key(:likes)
            expect(attributes[:likes]).to be(nil)

            expect(attributes).to have_key(:dislikes)
            expect(attributes[:dislikes]).to be(nil)

            expect(attributes).to have_key(:profile_image_link)
            expect(attributes[:profile_image_link]).to be_a(String)

            expect(attributes).to have_key(:latitude)
            expect(attributes[:latitude]).to be_a(Float)

            expect(attributes).to have_key(:longitude)
            expect(attributes[:longitude]).to be_a(Float)
          end
        end
      end

      describe "::authenticate_with" do
        context 'happy path' do
          it "returns a specific user provided they passed a valid email and password" do
            authenticated_user = File.read("spec/fixtures/authenticated_user.json")
            json_response = File.read("spec/fixtures/user.json")

            stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
              .to_return(status: 200, body: json_response)

            stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=test&q=stefanie@jaskolski-sanford.example")
              .to_return(status: 200, body: authenticated_user, headers: {})

            result = RenderService.new.authenticate_with("stefanie@jaskolski-sanford.example", "test")

            expect(result).to be_a(Hash)

            user = result[:data]
            expect(user).to be_a(Hash)

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
            expect(attributes[:latitude]).to be_a(Float)

            expect(attributes).to have_key(:longitude)
            expect(attributes[:longitude]).to be_a(Float)
          end
        end

        context "sad path" do
          it "returns an error message if user provided an invalid email password combo" do
            response = File.read("spec/fixtures/user_authentication_error.json")

            stub_request(:get, "https://jana-social-be.onrender.com/api/v1/search?p=testy&q=stefanie@jaskolski-sanford.example")
              .to_return(status: 200, body: response, headers: {})

            result = RenderService.new.authenticate_with("stefanie@jaskolski-sanford.example", "testy")

            expect(result).to be_a(Hash)

            errors = result[:errors]
            expect(errors).to be_an(Array)
            expect(errors[0]).to eq("Invalid username or password")
          end
        end
      end
    end
  end

  describe "events" do
    it "returns all events" do
      json_response = File.read("spec/fixtures/get_all_events.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events")
        .to_return(status: 200, body: json_response)

      results = RenderService.new.get_all_events
      expect(results).to be_a(Hash)

      events = results[:data]
      expect(events).to be_an(Array)

      events.each do |event|
        expect(event).to have_key(:id)
        expect(event[:id]).to be_a(String)

        expect(event).to have_key(:type)
        expect(event[:type]).to be_a(String)

        expect(event).to have_key(:attributes)
        expect(event[:attributes]).to be_a(Hash)

        attributes = event[:attributes]

        expect(attributes).to have_key(:title)
        expect(attributes[:title]).to be_a(String)

        expect(attributes).to have_key(:description)
        expect(attributes[:description]).to be_a(String)

        expect(attributes).to have_key(:street_address)
        expect(attributes[:street_address]).to be_a(String)

        expect(attributes).to have_key(:zipcode)
        expect(attributes[:zipcode]).to be_a(String)

        expect(attributes).to have_key(:date_time)
        expect(attributes[:date_time]).to be_a(String)

        expect(attributes).to have_key(:private_status)
        expect(attributes[:private_status]).to be_a(String) # change to boolean

        expect(attributes).to have_key(:host)
        expect(attributes[:host]).to be_a(String)
      end
    end
  end
end
