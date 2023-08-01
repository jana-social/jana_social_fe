class RenderService
  def get_all_events
    get_url("/api/v1/events")
  end

  def user_index
    get_url("/api/v1/users")
  end

  def user_search(_zipcode, _radius)
    # need to make the correct call
    get_url("/api/v1/users/search")
  end

  def user_show(user_id)
    get_url("/api/v1/users/#{user_id}")
  end

<<<<<<< HEAD
  def get_one_event(event_id)
    get_url("/api/v1/events/#{event_id}")
=======
  def authenticate_with(email, password)
    get_url("/api/v1/search?q=#{email}&p=#{password}")
  end

  def create_event(user_id, params)
    post_url("/api/v1/users/#{user_id}/events", { title: params[:title], description: params[:description], street_address: "#{params[:street_address]}, #{params[:city]}, #{params[:state]}", zipcode: params[:zipcode], date_time: params[:date_time], private_status: params[:private] })
>>>>>>> e4b91dd6b27264d123bbb7cfbd15f9281348bfd0
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def post_url(url, params)
    conn.post(url, params)
  end

  def conn
    ## Alway comment this in before pushing to production
    Faraday.new(url: 'https://jana-social-be.onrender.com/')
    # Faraday.new(url: "http://localhost:3000")
    # change to http://localhost:3000 for local testing if needed
  end
end
