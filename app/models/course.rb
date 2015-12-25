class Course < ActiveRecord::Base
  belongs_to :user

  def date_format(date)
    date.strftime('%I:%M:%S %p')
  end
end
