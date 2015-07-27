class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, index: true
      t.belongs_to :client, index: true
      t.timestamps null: false
    end
  end
end
