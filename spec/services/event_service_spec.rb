require 'rails_helper'

RSpec.describe EventService do
  describe 'get_events' do
    it 'returns all events' do
      service = EventService.new
      events = service.get_all_events
      expect(events).to be_an(Array)
      expect(events.first).to be_a(Hash)
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
      expect(events.first).to have_key(:private)
      expect(events.first.private).to be_a(Boolean)
      expect(events.first).to have_key(:host)
      expect(events.first.host).to be_a(Integer)
    end
  end
end