class HomeworksController < ApplicationController
  expose :homework
  expose :homeworks do
    current_user.homeworks
  end
  expose :courses do
    current_user.courses
  end

  def create
    homework = Homework.new(homeworks_params)
    homework.save
  end

  def destroy
    homework = Homework.find(params[:id])
    homework.destroy
  end

  private
  def homeworks_params
    params.require(:homework).permit(
      :name,
      :description,
      :due_date,
      :course_id,
      :time_approximation
    )
  end


end
