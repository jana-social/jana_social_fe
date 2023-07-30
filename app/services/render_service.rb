class RenderService
  def get_all_events
    get_url("/api/v1/events")
  end

  def user_index
    get_url("/api/v1/users")
  end

  def user_show(user_id)
    get_url("/api/v1/users/#{user_id}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://jana-social-be.onrender.com")
    # change to https://localhost:3000 for local testing if needed
  end
end
