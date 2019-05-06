class UserEventsController < ApplicationController

  def index
    @user_events = UserEvent.all
  end

  def show
    @user_event = UserEvent.find(params[:id])
    @creator = @user_event.user.first_name
  end

  def new
    @users = User.all
    @user_event = UserEvent.new
    # @name = current_user.first_name
  end

  def create
    @user_event = UserEvent.new(user_event_params)
    if @user_event.user_id = current_user.id
      @user_event.save
      redirect_to @user_event
    else
      flash[:message] = "Have to be a user to create an event"
      render 'users/new'
    end
  end

  def edit
    @users = User.all
    @user_event = UserEvent.find(params[:id])
  end

  def update
    @users = User.all
    @user_event = UserEvent.find(params[:id])
    @user_event.update(user_event_params)
    redirect_to @user_event
  end

  def destroy
    @user_event = UserEvent.find(params[:id])
    @user_event.destroy
    redirect_to user_events_path
  end

  private

  def user_event_params
    params.require(:user_event).permit(:title, :description, :location, :date, :user_id)
  end

end
