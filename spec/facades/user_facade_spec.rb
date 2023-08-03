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
      it "returns a list of all users" do #is this all or just one user?
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

    describe "::searched_users" do
      it "returns users within search radius of user" do
        user_id = 1
        distance = 500

        json_response = File.read("spec/fixtures/user_search_response.json")
        stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/#{user_id}/find_friends?distance=#{distance}").
          to_return(status: 200, body: json_response, headers: {})

          results = UserFacade.new.searched_users(1, 500)

        results.each do |result|
          expect(result).to be_a(UserSearch)
          expect(result.bio).to be_a(String)
          expect(result.dislikes).to be_a(String)
          expect(result.likes).to be_a(String)
          expect(result.photo_url).to be_a(String)
          expect(result.username).to be_a(String)
        end
      end
    end
  end
end
