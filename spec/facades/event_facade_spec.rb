require "rails_helper"

RSpec.describe EventFacade, :vcr do
  describe 'get_all_events' do
    it 'returns all events' do
      facade = EventFacade.new
      events = facade.get_all_events
      expect(events).to be_an(Array)
      expect(events.first).to be_a(Event)
    end
  end
end