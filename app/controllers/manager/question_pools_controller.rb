class Manager::QuestionPoolsController < ApplicationController

    def new
    @user_id = current_user.id
    @question_pool = QuestionPool.new
    @questions = @question_pool.questions.build
  end

  def create
    if QuestionPool.where(user: current_user).empty?
      @question_pool = QuestionPool.new(question_pool_params)
      @question_pool.user = current_user
      @question_pool.save!
      redirect_to new_manager_question_pool_path
    else
      @question_pool = QuestionPool.where(user: current_user)
      @question_pool.update question_pool_params
       redirect_to new_manager_question_pool_path
    end
  end

  def index
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
  end

  private

  def question_pool_params
    params.require(:question_pool).permit(questions_attributes: [:name, :id, :cat])
  end
end
