class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.date :start_date
      t.date :completed_date 
      t.integer :status, default: 0
      t.integer :created_by

      t.timestamps
    end
  end
end
