require 'rails_helper'

RSpec.describe RenderService do
  describe 'get_events' do
    it 'returns all events' do
      service = RenderService.new
      events = service.get_all_events

      expect(events).to be_a(Hash) # switched from Array
      expect(events.first).to be_an(Array) # switched form Hash
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
      expect(events.first).to have_key(:private_status)
      expect(events.first.private_status).to be_a(Boolean) # integer? 0, 1, 2
      expect(events.first).to have_key(:host)
      expect(events.first.host).to be_a(Integer)
    end
  end
end