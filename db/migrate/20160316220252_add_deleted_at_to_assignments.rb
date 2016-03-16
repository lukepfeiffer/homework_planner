class AddDeletedAtToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :deleted_at, :datetime
  end
end
