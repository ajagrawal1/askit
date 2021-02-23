class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index 
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(current_user.id)
    @question = @user.question.create(question_params)
    redirect_to questions_path
  end

  def show
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update 
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
