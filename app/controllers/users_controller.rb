class UsersController < ApplicationController
  def new; end

  def create
    UserFacade.new.create_user(user_params)
    flash[:success] = "Your account has been created, go ahead and log in!"
    redirect_to root_path
  end

  def show
    @user = UserFacade.new.find_user(current_user)
  end

  def edit
    @user = UserFacade.new.find_user(params[:id])
  end

  def update
    @user = UserFacade.new.find_user(params[:id])
    if @user.update(user_params)
      redirect_to dashboard_path(@user.id)
    else
      redirect_to edit_user_path(@user.id)
      flash[:notice] = "Data is not valid. Please try again"
    end
  end

  def update_photo
    @user = UserFacade.new.find_user(params[:id])
    require 'pry'; binding.pry
    UserFacade.new.send_photo(params[:id], params[:file])
    redirect_to edit_user_path(@user.id)
  end
end

private

def user_params
  params.require(:user).permit(:username, :email, :password, :zipcode, :street_address, :bio, :likes, :dislikes, :profile_image_link, :latitude, :longitude)            
end
