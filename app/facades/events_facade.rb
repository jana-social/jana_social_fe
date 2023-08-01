class EventsFacade
  def get_all_events
    service = RenderService.new
    request = service.get_all_events
    request[:data].map do |event_data|
      Event.new(event_data)
    end
  end

  def get_one_event(event_id)
    service = RenderService.new
    request = service.get_one_event(event_id)
    if request[:data].present? && request[:data].is_a?(Array)
      Event.new(request[:data][0])
    else
      nil
    end
  end
end
