class AddIndexToProject < ActiveRecord::Migration
  def change
    add_index :projects,  :job_number
    add_index :projects,  :status
    add_index :projects,  :suitable_reference
    add_index :projects,  :name
    add_index :projects,  :type
  end
end
