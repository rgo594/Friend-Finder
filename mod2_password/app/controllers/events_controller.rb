class EventsController < ApplicationController
    def index
      @events = Event.all
    end

    def show
      @event = Event.find(params[:id])
    end

    def new
      @users = User.all
      @event = Event.new
      @name = current_user.first_name
    end

    def create
      @event = Event.new(event_params)
      if @event.users.ids[0] = current_user.id
        @event.save
        redirect_to @event
        # byebug
      else
        flash[:message] = "Have to be a user to create an event"
        render 'users/new'
      end
    end

    def edit
      @users = User.all
      @event = Event.find(params[:id])
    end

    def update
      @users = User.all
      @event = Event.find(params[:id])
      @event.update(event_params)
      redirect_to @event
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to events_path
    end

    private

    def event_params
      params.require(:event).permit(:title, :description, :location, :date, :user_id, :event_id)
    end
end
