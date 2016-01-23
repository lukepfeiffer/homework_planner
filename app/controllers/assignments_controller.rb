class AssignmentsController < ApplicationController
  expose :assignment
  expose :assignments do
    current_user.assignments
  end
  expose :courses do
    current_user.courses
  end

  def create
    assignment = Assignment.new(assignments_params)
    assignment.save
    render partial: 'assignment_row', locals: {assignment: assignment}
  end

  def destroy
    assignment = Assignment.find(params[:id])
    assignment.destroy
    head :no_content
  end

  private
  def assignments_params
    params.require(:assignment).permit(
      :name,
      :description,
      :due_date,
      :course_id,
      :time_approximation
    )
  end


end
