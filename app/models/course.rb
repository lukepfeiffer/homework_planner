class Course < ActiveRecord::Base
  belongs_to :user
  has_many :homeworks

  def date_format(date)
    date.strftime('%I:%M:%S %p')
  end
end
