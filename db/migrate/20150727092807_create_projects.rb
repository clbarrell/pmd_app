class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :job_number
      t.decimal :total, precision: 9, scale: 2
      t.integer :probability
      t.string :service_line
      t.string :status
      t.string :type
      t.boolean :suitable_reference
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
