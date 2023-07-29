class RenderService

  def get_all_events
    get_url("api/v1/events")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn 
    Faraday.new(url: 'https://jana-social-be.onrender.com/')
  end
end