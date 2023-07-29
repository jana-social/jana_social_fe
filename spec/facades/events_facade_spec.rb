require "rails_helper"

RSpec.describe EventsFacade do
  describe 'class methods' do
    describe '.get_all_events' do
      it 'returns all events' do
        events = EventsFacade.new.get_all_events

        expect(events).to be_an(Array)
        expect(events.first).to be_a(Event)
      end
    end
  end
end