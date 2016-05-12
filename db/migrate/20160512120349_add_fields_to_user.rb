class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :text_alerts, :boolean
    add_column :users, :phone_number, :string
  end
end
