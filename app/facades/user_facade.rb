class UserFacade
  def all_users
    json = service.user_index

    @users = json[:data].map { |details| User.new(details) }
  end

  def find_user(user_id)
    json = service.user_show(user_id)

    @user = User.new(json[:data])
  end

  def find_by_email(email)
    json = service.user_email_search(email)

    @user = User.new(json[:data])
  end

  private

  def service
    RenderService.new
  end
end
