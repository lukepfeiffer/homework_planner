class Assignment < ActiveRecord::Base
  belongs_to :course
  validates_presence_of :name, :due_date
  scope :active, -> {where(deleted_at: nil)}
end
