require "rails_helper"

RSpec.describe EventsFacade, :vcr do
  describe "get_all_events" do
    xit "returns all events" do
      facade = EventsFacade.new
      events = facade.get_all_events
      expect(events).to be_an(Array)
      expect(events.first).to be_a(Event)
    end
  end
end
