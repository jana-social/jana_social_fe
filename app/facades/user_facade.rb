class UserFacade
  def all_users
    json = service.user_index

    @users = json[:data].map { |details| User.new(details[:attributes]) }
  end

  def find_user(user_id)
    json = service.user_show(user_id)

    @user = User.new(json[:data][:attributes])
  end

  def find_by_email(email, password)
    json = service.search_by_email_and_password(email, password)
  end

  private

  def service
    RenderService.new
  end
end
