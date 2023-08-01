class EventUserFacade

  def get_all_attendees(event_id)
    request = service.get_all_attendees(event_id)
    request[:data].map do |event_user_data|
      EventUser.new(event_user_data)
    end
  end

  def service
    RenderService.new
  end
end