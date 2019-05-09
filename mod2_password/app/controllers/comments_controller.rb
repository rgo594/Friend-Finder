class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :create, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create

    @comment = Comment.new(context: params[:comment][:context], user_id: session[:user_id], story_id: params[:story_id])
    if @comment.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:story_id])
    @comment.destroy
    redirect_to story_path
  end

  private

  def set_comment
    @user = User.find(session[:user_id])
    @story = Story.find(params[:story_id])
  end


end
