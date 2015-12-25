class CreateCourse < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.time :start_time
      t.time :end_time
      t.text :description
      t.string :name
      t.string :teacher_name
      t.integer :days_of_the_week
      t.integer :user_id
      t.timestamp
    end
  end
end
