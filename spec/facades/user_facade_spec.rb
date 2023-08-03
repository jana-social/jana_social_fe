require "rails_helper"

RSpec.describe UserFacade do
  context "class methods" do
    describe "::all_users" do
      it "returns a list of all users" do
        json_response = File.read("spec/fixtures/users.json")
        stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users")
          .to_return(status: 200, body: json_response)

        results = UserFacade.new.all_users

        expect(results).to be_an(Array)

        results.each do |result|
          expect(result).to be_a(User)
          expect(result.bio).to be_a(String)
          expect(result.dislikes).to be_a(String)
          expect(result.email).to be_a(String)
          expect(result.id).to be_a(String)
          expect(result.likes).to be_a(String)
          expect(result.photo_url).to be_a(String)
          expect(result.street_address).to be_a(String)
          expect(result.username).to be_a(String)
          expect(result.zipcode).to be_a(String)
        end
      end
    end

    describe "::find_user" do
      it "returns a list of all users" do
        json_response = File.read("spec/fixtures/user.json")
        stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1")
          .to_return(status: 200, body: json_response)

        result = UserFacade.new.find_user(1)

        expect(result).to be_a(User)
        expect(result.bio).to be_a(String)
        expect(result.dislikes).to be_a(String)
        expect(result.email).to be_a(String)
        expect(result.likes).to be_a(String)
        expect(result.photo_url).to be_a(String)
        expect(result.street_address).to be_a(String)
        expect(result.username).to be_a(String)
        expect(result.zipcode).to be_a(String)
      end
    end

    describe "::create_user" do
      it "returns a created user" do

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
        to_return(status: 200, body: response , headers: {})
        result = UserFacade.new.create_user(user_params)

        expect(result).to be_a(User)
        expect(result.bio).to be(nil)
        expect(result.dislikes).to be(nil)
        expect(result.email).to be_a(String)
        expect(result.likes).to be(nil)
        expect(result.photo_url).to be_a(String)
        expect(result.street_address).to be(nil)
        expect(result.username).to be_a(String)
        expect(result.zipcode).to be_a(String)
      end
    end
  end
end
