class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    # @_current_user ||= User.find(session[:user_id]) if session[:user_id]
    @_current_user = session[:user_id]
  end

  def welcome
  end

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
