class EventsFacade
  def get_all_events
    request = service.get_all_events
    request[:data].map do |event_data|
      Event.new(event_data)
    end
  end

<<<<<<< HEAD
  def get_one_event(event_id)
    service = RenderService.new
    request = service.get_one_event(event_id)
    if request[:data].present? && request[:data].is_a?(Array)
      Event.new(request[:data][0])
    else
      nil
    end
=======
  def create_event(user, event_params)
    service.create_event(user, event_params)
  end

  def service
    RenderService.new
>>>>>>> e4b91dd6b27264d123bbb7cfbd15f9281348bfd0
  end
end
