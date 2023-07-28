class UserFacade
  def all_users
    service = RenderService.new

    json = service.user_index

    @users = json[:data].map { |details| User.new(data) }
  end

  def find_user(user_id)
    service = RenderService.new

    json = service.user_show(user_id)

    @user = User.new(json[:data])
  end
end