class Assignment < ActiveRecord::Base
  belongs_to :course
  validates_presence_of :name, :due_date
end
