require "rails_helper"

RSpec.describe EventsFacade do
  describe "class methods" do
    describe "::get_all_events" do
      it "returns all events" do
        json_response = File.read("spec/fixtures/get_all_events.json")
        stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events")
          .to_return(status: 200, body: json_response)

        results = EventsFacade.new.get_all_events

        expect(results).to be_an(Array)
        results.each do |result|
          expect(result).to be_a(Event)
          expect(result.title).to be_a(String)
          expect(result.description).to be_a(String)
          expect(result.street_address).to be_a(String)
          expect(result.zipcode).to be_a(String)
          expect(result.date_time).to be_a(String)
          expect(result.private_status).to be_in([true, false])
          expect(result.host).to be_an(Integer)
        end
      end
    end

    describe "::get_one_event" do
      it "returns one event" do
        json_response = File.read("spec/fixtures/get_one_event.json")
        stub_request(:get, "https://jana-social-be.onrender.com/api/v1/events/1")
          .to_return(status: 200, body: json_response)

        result = EventsFacade.new.get_one_event(1)

        expect(result).to be_a(Event)
        expect(result.title).to be_a(String)
        expect(result.description).to be_a(String)
        expect(result.street_address).to be_a(String)
        expect(result.zipcode).to be_a(String)
        expect(result.date_time).to be_a(String)
        expect(result.private_status).to be_in([true, false])
        expect(result.host).to be_an(Integer)
      end
    end
  end

  describe "::get_hosting" do
    it "returns all user's hosting events" do
      json_response = File.read("spec/fixtures/get_hosting_events.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1/events/hosting")
        .to_return(status: 200, body: json_response)

      results = EventsFacade.new.get_hosting(1)
      expect(results).to be_an(Array)

      results.each do |event|
        expect(event.date_time).to be_a(String)
        expect(event.description).to be_a(String)
        expect(event.host).to be_a(String)
        expect(event.id).to be_a(String)
        expect(event.private_status).to be_in([true, false])
        expect(event.street_address).to be_a(String)
        expect(event.title).to be_a(String)
        expect(event.zipcode).to be_a(String)
      end
    end
  end

  describe "::get_attending" do
    it "returns all user's attending events" do
      json_response = File.read("spec/fixtures/get_attending_events.json")
      stub_request(:get, "https://jana-social-be.onrender.com/api/v1/users/1/events/attending")
        .to_return(status: 200, body: json_response)

      results = EventsFacade.new.get_attending(1)
      expect(results).to be_an(Array)

      results.each do |event|
        expect(event.date_time).to be_a(String)
        expect(event.description).to be_a(String)
        expect(event.host).to be_a(String)
        expect(event.id).to be_a(String)
        expect(event.private_status).to be_in([true, false])
        expect(event.street_address).to be_a(String)
        expect(event.title).to be_a(String)
        expect(event.zipcode).to be_a(String)
      end
    end
  end

  describe "::update_event" do
    it "returns an updated event" do
      json_response = File.read("spec/fixtures/update_user_event.json")
      url = "https://jana-social-be.onrender.com/api/v1/users/1/events/1"
      stub_request(:patch, url)
        .to_return(status: 200, body: json_response)

        event_params = {
          title: "Updated Event Toitle"
        }

      result = EventsFacade.new.update_event(1, 1, event_params)

      expect(result).to be_a(Hash)

      expect(result[:attributes][:title]).to be_a(String)
      expect(result[:attributes][:description]).to be_a(String)
      expect(result[:attributes][:street_address]).to be_a(String)
      expect(result[:attributes][:zipcode]).to be_a(String)
      expect(result[:attributes][:date_time]).to be_a(String)
      expect(result[:attributes][:private_status]).to be_in([true, false])
      expect(result[:attributes][:host]).to be_an(Integer)

    end
  end
end
