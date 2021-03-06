class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]

  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
   respond_to do |format|
      if @comment.save
        format.html { redirect_to :back, notice: "Comment has been added." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
	rescue ActionController::RedirectBackError
	redirect_to restaurants_path
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :restaurant_id, :comment)
    end
end
