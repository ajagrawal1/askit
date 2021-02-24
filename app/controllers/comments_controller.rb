class CommentsController < ApplicationController
  before_action :load_commentable

  def index
   @comments = @commentable.comment
  end
    
  def new
    @comment = @commentable.comment.new
  end

  def create
    @comment = @commentable.comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: "Comment created and will be displayed when approved by Admin."
    else
      render :new
    end
  end

  private

  def load_commentable
    if params[:answer_id]
      @commentable = Answer.find(params[:answer_id])
    elsif params[:question_id]
      @commentable = Question.find(params[:question_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
