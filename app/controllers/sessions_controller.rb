class SessionsController < ApplicationController
  def login_form; end

  def login
    user = UserFacade.new.authenticate(params[:email], params[:password])
    if user == nil
      flash[:error] = 'Sorry, your credentials are invalid.'
      redirect_to root_path
    else
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to dashboard_path(user.id)
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end
end
