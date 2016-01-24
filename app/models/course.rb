class Course < ActiveRecord::Base
  belongs_to :user
  has_many :assignments
  validates_presence_of :name, :teacher_name, :start_time, :end_time
end
