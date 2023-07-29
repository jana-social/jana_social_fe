require "rails_helper"

RSpec.describe Event, :vcr do
  describe "initialize" do
    xit "exists with attributes" do
      data = { id: "1",
               type: "event",
               attributes: { title: "Test Event",
                             description: "This is a test event",
                             street_address: "123 Main St",
                             zipcode: "80202",
                             date_time: "2021-08-06T14:00:00.000-06:00",
                             private: false,
                             host: 1 } }
      event = Event.new(data)

      expect(event).to be_a(Event)
      expect(event.id).to eq("1")
      expect(event.title).to eq("Test Event")
      expect(event.description).to eq("This is a test event")
      expect(event.street_address).to eq("123 Main St")
      expect(event.zipcode).to eq("80202")
      expect(event.date_time).to eq("2021-08-06T14:00:00.000-06:00")
      expect(event.private).to eq(false)
      expect(event.host).to eq(1)
    end
  end
end
