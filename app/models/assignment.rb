class Assignment < ActiveRecord::Base
  belongs_to :course
  validates_presence_of :name, :due_date
  scope :active, -> {where(deleted_at: nil)}
  scope :archived, -> {where.not(deleted_at: nil)}
  scope :by_scope, -> (scope){
    case scope
    when 'active'
      active
    when 'archived'
      archived
    when 'all'
      all
    else
      active
    end
  }
end
