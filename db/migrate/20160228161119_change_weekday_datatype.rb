class ChangeWeekdayDatatype < ActiveRecord::Migration
  def change
    remove_column :courses, :days_of_the_week, :integer
    add_column :courses, :days_of_the_week, :string
  end
end
