require 'rails_helper'

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
          # expect(result.private_status).to be_a(String)
          expect(result.host).to be_a(String)
        end
      end
    end
  end
end
