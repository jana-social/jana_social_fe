class EventsFacade
  def get_all_events
    request = service.get_all_events
    request[:data].map do |event_data|
      Event.new(event_data)
    end
  end

  def get_one_event(event_id)
    request = service.get_one_event(event_id)
    if request[:data].present? && request[:data].is_a?(Array)
      Event.new(request[:data][0])
    else
      nil
    end
  end

  def create_event(user, event_params)
    service.create_event(user, event_params)
  end

  def service
    RenderService.new
  end
end
