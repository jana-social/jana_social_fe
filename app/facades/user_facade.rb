class UserFacade
  def all_users
    json = service.user_index

    @users = json[:data].map { |details| User.new(details) }
  end

  def find_user(user_id)
    json = service.user_show(user_id)

    @user = User.new(json[:data])
  end

  def authenticate(email, password)
    json = service.authenticate_with(email, password)

    @user = (User.new(json[:data]) if json.key?(:data))
  end

  def searched_users(zipcode, radius)
    json = service.user_search(zipcode, radius)
    @users = json[:data].map { |details| UserSearch.new(details[:attributes]) }
  end

  def create_user(user_params)
    json = service.create_user('/api/v1/users/', user_params)
    @user = User.new(json[:data])
  end

  private

  def service
    RenderService.new
  end
end
