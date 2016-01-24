class Assignment < ActiveRecord::Base
  belongs_to :course
  validates_presence_of :name, :course_id, :due_date
end
