class AssignmentsController < ApplicationController

  expose :assignment
  expose :assignments do
    if params[:scope].present?
      current_user.assignments.by_scope(params[:scope])
    elsif params[:search].present?
      Assignment.fuzzy_search(name: params[:search])
    else
      current_user.assignments.by_scope(params[:scope])
    end
  end
  expose :courses do
    current_user.courses
  end

  def create
    assignment = Assignment.new(assignment_params)
    if assignment.save
      render partial: 'assignment_container', locals: {assignment: assignment}
    else
      head :no_content
    end
  end

  def update
    if assignment.update(assignment_params)
      render partial: 'assignment_container', locals: {assignment: assignment}
    else
      head :no_content
    end
  end

  def destroy
    assignment = Assignment.find(params[:id])
    assignment.update(deleted_at: DateTime.now)
    head :no_content
  end

  private

  def assignment_params
    params.require(:assignment).permit(
      :name,
      :description,
      :due_date,
      :course_id,
      :time_approximation
    )
  end


end
