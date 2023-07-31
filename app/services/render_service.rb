class RenderService
  def get_all_events
    get_url("/api/v1/events")
  end

  def user_index
    get_url("/api/v1/users")
  end

  def user_search(zipcode, radius)
    # need to make the correct call
    get_url("/api/v1/users/search")
  end

  def user_show(user_id)
    get_url("/api/v1/users/#{user_id}")
  end

  def authenticate_with(email, password)
    get_url("/api/v1/search?q=#{email}&p=#{password}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    ## Alway comment this in before pushing to production
    # Faraday.new(url: 'https://jana-social-be.onrender.com/')
    Faraday.new(url: "http://localhost:3000")
    # change to http://localhost:3000 for local testing if needed
  end
end
