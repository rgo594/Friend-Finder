class MessagesController < ApplicationController

  before_action :find_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order("created_at DESC")  #displaying all the message in a decendent orders
  end

  def show
  end

  def new
    @message = Message.new
    # @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.user_id = current_user.id
    # @message = Message.new(message_params)
      redirect_to messages_path
    else
      render :new
    end
  end

    def edit
    end

    def update
      if @message.update(message_params)
        redirect_to message_path
      else
        render :edit
      end
    end

    def destroy
      @message.destroy
      redirect_to messages_path
    end





    private


    def message_params
      params.require(:message).permit(:title, :description)
    end

    def find_message
      @message = Message.find(params[:id])
    end

end
