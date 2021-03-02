class AnswersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answer.create(answer_params)
    @answer.user_id= current_user.id
    @answer.save
    redirect_to question_path(@question), notice: "Your answer will be visible once approved by Admin"
  end

  def show
    @answers = Answer.where(user_id: current_user.id).paginate(page: params[:page], per_page: 5)
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
