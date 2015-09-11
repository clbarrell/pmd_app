class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :project_splits, :type, :role
  end
end
