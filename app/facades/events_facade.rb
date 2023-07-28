class EventsFacade

  def get_all_events
    service = EventsService.new
    request = service.get_all_events
    events = request[:data].map do |event_data|
      Event.new(event_data)
    end
  end
end
