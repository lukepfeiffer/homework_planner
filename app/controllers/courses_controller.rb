class CoursesController < ApplicationController
  expose :course
  expose :courses do
    current_user.courses
  end

  def create
    course = Course.new(courses_params)
    if course.save
      render partial: 'course_row', locals: {course: course}
    else
      head :no_content
    end
  end

  def destroy
    course = Course.find(params[:id])
    assignment = Assignment.where(course_id: course.id)
    course.destroy
    assignment.destroy_all
    head :no_content
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
