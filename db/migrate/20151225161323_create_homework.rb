class CreateHomework < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :name
      t.text :description
      t.integer :course_id
      t.datetime :due_date
      t.decimal :time_approximation
    end
  end
end
