class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, index: true
      t.string :email
      t.string :initials, index: true
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
