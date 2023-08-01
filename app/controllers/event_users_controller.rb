class EventUsersController < ApplicationController
  def create
    event_user = EventUser.new(event_user_params)
    if event_user.save
      flash[:success] = "You have successfully joined the event!"
      redirect_to event_path(event_user.event_id)
    else
      flash[:error] = "You have already joined this event!"
      redirect_to event_path(event_user.event_id)
    end
  end

  def destroy
    event_user = EventUser.find_by(event_id: params[:event_id], user_id: current_user.id)
    event_user.destroy
    flash[:success] = "You have successfully left the event!"
    redirect_to event_path(event_user.event_id)
  end

  private

  def event_user_params
    params.permit(:event_id, :user_id)
  end
end