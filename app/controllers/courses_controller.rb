class CoursesController < ApplicationController
  expose :course
  expose :courses do
    current_user.courses
  end

  def create
    course = Course.new(courses_params)
    course.save
    redirect_to courses_path
  end

  private
  def courses_params
    params.require(:course).permit(
      :name,
      :teacher_name,
      :user_id,
      :start_time,
      :end_time,
      :days_of_the_week
    )
  end
end
