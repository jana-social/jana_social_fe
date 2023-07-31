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

    if json.has_key?(:data)
      @user = User.new(json[:data])
    else
      @user = nil
    end

  end

  private

  def service
    RenderService.new
  end
end
