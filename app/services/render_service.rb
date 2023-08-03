class RenderService
  def get_all_events
    get_url("/api/v1/events")
  end

  def user_index
    get_url("/api/v1/users")
  end

  def user_search(user_id, radius)
    get_url("/api/v1/users/#{user_id}/find_friends?distance=#{radius}")
  end

  def user_show(user_id)
    get_url("/api/v1/users/#{user_id}")
  end

  def get_one_event(event_id)
    get_url("/api/v1/events/#{event_id}")
  end

  def get_hosting_events(user_id)
    get_url("/api/v1/users/#{user_id}/events/hosting")
  end

  def get_attending_events(user_id)
    get_url("/api/v1/users/#{user_id}/events/attending")
  end

  def authenticate_with(email, password)
    get_url("/api/v1/search?q=#{email}&p=#{password}")
  end

  def update_user_events(user_id, event_id)
    post_url("/api/v1/users/#{user_id}/events/#{event_id}")
  end

  def friend_status(user_id, friend_id, status)
    friend_post_url("/api/v1/friendships/", { user_id: user_id, friend_id: friend_id, status: status })
  end

  def create_event(user_id, params)
    post_url("/api/v1/users/#{user_id}/events", { title: params[:title], description: params[:description], street_address: "#{params[:street_address]}, #{params[:city]}, #{params[:state]}", zipcode: params[:zipcode], date_time: params[:date_time], private_status: params[:private] })
  end

  def update_event(user_id, event_id, params)
    patch_url("/api/v1/users/#{user_id}/events/#{event_id}", { title: params[:title], description: params[:description], street_address: "#{params[:street_address]}, #{params[:city]}, #{params[:state]}", zipcode: params[:zipcode], date_time: params[:date_time], private_status: params[:private] })
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def patch_url(url, params)
    response = conn.patch(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def post_url(url, params)
    response = conn.post(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_url(url)
    response = conn.delete(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def friend_post_url(url, params)
    conn.post(url, params)
  end

  def conn
    ## Alway comment this in before pushing to production
    Faraday.new(url: "https://jana-social-be.onrender.com")
    # Faraday.new(url: "http://localhost:3000")
    # change to http://localhost:3000 for local testing if needed
  end
end
