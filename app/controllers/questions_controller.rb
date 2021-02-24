class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :check_user_status, except: [:index]

  def index 
    @questions = Question.where(approve: "true")
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

  def user_question
    @questions = Question.where(user_id: current_user.id)
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :image)
  end
end
