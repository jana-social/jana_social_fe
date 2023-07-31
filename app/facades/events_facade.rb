class EventsFacade
  def get_all_events
    request = service.get_all_events
    request[:data].map do |event_data|
      Event.new(event_data)
    end
  end

  def create_event(user, event_params)
    service.create_event(user, event_params)
  end

  def service
    RenderService.new
  end
end
