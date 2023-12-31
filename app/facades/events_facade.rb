class EventsFacade
  def get_all_events
    request = service.get_all_events
    request[:data].map do |event_data|
      Event.new(event_data)
    end
  end

  def get_one_event(event_id)
    request = service.get_one_event(event_id)
    return unless request[:data].present? && request[:data].is_a?(Array)
    Event.new(request[:data][0])
  end

  def create_event(user, event_params)
    service.create_event(user, event_params)
  end

  def delete_an_event(user_id, event_id)
    service.destroy_event(user_id, event_id)
  end

  def get_hosting(user)
    request = service.get_hosting_events(user)
    request[:data].map do |event|
      Event.new(event)
    end
  end

  def get_attending(user)
    request = service.get_attending_events(user)
    request[:data].map do |event|
      Event.new(event)
    end
  end

  def update_event(user_id, event_id, event_params)
    service.update_event(user_id, event_id, event_params)
  end

  def service
    RenderService.new
  end
end
