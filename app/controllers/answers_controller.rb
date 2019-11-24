class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.save!
  end

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
