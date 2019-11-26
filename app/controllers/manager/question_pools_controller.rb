class Manager::QuestionPoolsController < ApplicationController

<<<<<<< HEAD
    def new
=======
  def new
    @user_id = current_user.id
>>>>>>> 6a37bec... User can access review from link
    @question_pool = QuestionPool.new
    @questions = @question_pool.questions.build
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    if QuestionPool.where(restaurant_id: params[:restaurant_id]).empty?
      @restaurant = Restaurant.find(params[:restaurant_id])
      @question_pool = QuestionPool.new(question_pool_params)
<<<<<<< HEAD
      @question_pool.restaurant = @restaurant
      @question_pool.save!
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      @question_pool = QuestionPool.where(restaurant_id: params[:restaurant_id])
      if @question_pool.update question_pool_params
      respond_to do |format|
        format.html { redirect_to new_manager_restaurant_question_pool_path(@restaurant) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      ''
    end
=======
      @question_pool.user = current_user
      @question_pool.save
      redirect_to new_manager_question_pool_path
    else
      @question_pool = QuestionPool.where(user: current_user)
      @question_pool.update question_pool_params
      redirect_to new_manager_question_pool_path
>>>>>>> 6a37bec... User can access review from link
    end
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @question = Question.find(params[:id])
    @question.destroy!
  end

  private

  def question_pool_params
    params.require(:question_pool).permit(:nameq, questions_attributes: [:name, :id, :cat])
  end
end
