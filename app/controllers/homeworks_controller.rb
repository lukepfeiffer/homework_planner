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
    render partial: 'homework_row', locals: {homework: homework}
  end

  def destroy
    homework = Homework.find(params[:id])
    homework.destroy
    head :no_content
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
