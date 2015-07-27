class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, index:true
      t.timestamps null: false
      t.references :organisation, index:true
    end
  end
end
