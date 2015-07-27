class CreateProjectSplits < ActiveRecord::Migration
  def change
    create_table :project_splits do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.string :type
      t.decimal :percentage, precision: 4, scale: 1
      t.timestamps null: false
    end
  end
end
