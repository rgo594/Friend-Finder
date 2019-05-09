class StoriesController < ApplicationController
  before_action :set_story , only: [:edit, :update, :show, :destroy]


  def index
    @stories = Story.all.order("created_at DESC")
  end

  def show
   @story = Story.find(params[:id])
   @user = @story.user.first_name
   @comments = Comment.all
  end

  def new
    @story = Story.new
    # @user = User.find(params[:user_id])
  end

  def create

    # @user = User.find(session[:user_id])
    @story = Story.new(title: params[:story][:title], content: params[:story][:content], img_url: params[:story][:img_url], user_id: session[:user_id])

    if @story.user_id == current_user.id
      @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  def edit
  end

  def update
      @story = Story.find(params[:id])
    if@story.user_id == current_user.id
      @story.update(story_params)
      redirect_to story_path
    else
      render :edit
    end
  end


  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to story_path
  end

  private

  def story_params
    params.require(:story).permit(:title, :content, :img_url)
  end

  def set_story
    @user = User.find(session[:user_id])

  end

end
