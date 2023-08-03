class UsersController < ApplicationController
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
    redirect_to edit_user_path(@user.id)
  end
end

private

def user_params
  params.require(:user).permit(:username, :email, :password, :zipcode, :street_address, :bio, :likes, :dislikes, :profile_image_link, :latitude, :longitude)            
end
