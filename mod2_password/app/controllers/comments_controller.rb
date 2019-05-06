class CommentsController < ApplicationController

  before_action :find_message
  before_action :find_comment, only: [:edit, :update, :destroy]

  def create

    @comment = @message.comment.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to message_path(@message)
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @comment.upadte(comment_params)
      redirect_to message_path
    else
      render :edit
    end
  end


  def destroy
    @comment.destory
    redirect_to message_path
  end



    private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def find_message
      @message = Message.find(params[:message_id])
    end

    def find_comment
      @comment = @message.comment.find(params[:message_id])
    end
end
