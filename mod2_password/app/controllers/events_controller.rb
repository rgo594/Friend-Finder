class EventsController < ApplicationController
    def index
      @events = Event.all
    end

    def show
      @event = Event.find(params[:id])
      @user_event = UserEvent.all
      user_name
      user_id
    end

    def new
      @event = Event.new
    end

    def create
      # @user_event = UserEvent.new
      @user = current_user
      @event = Event.new(event_params)
      if @event.valid?
        @event.save
        @user_event = UserEvent.create(event_id: @event.id, user_id: current_user.id)
        redirect_to @event
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
      UserEvent.select do |event|
        if event.event_id == @event.id
          event.destroy && @event.destroy
        end
      end
      redirect_to events_path
    end

    def user_name
      UserEvent.select do |event|
         if event.event_id == @event.id
           @user = event.user.first_name
        end
      end
    end

    def user_id
      UserEvent.select do |event|
         if event.event_id == @event.id
           @user_id = event.user_id
          end
        end
      end

    def my_events
      @events = Event.all
      @user_event = UserEvent.select{|ue| ue.user_id == current_user.id}
      @event_ids = @user_event.map{|ue| ue.event_id}
    end

    def follow_event
      @user_event = UserEvent.create(user_id: current_user2.id, event_id: 20, follower_id: 1)
      redirect_to '/users'
    end

    private

    def event_params
      params.require(:event).permit(:title, :description, :location, :date, :user_id, :event_id, :profile_pic)
    end
end
