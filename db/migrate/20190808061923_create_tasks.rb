class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.date :start_date
      t.date :completed_date
      t.integer :status, default: 0
      t.integer :estimation_in_hours
      t.integer :created_by
      t.references :project, foreign_key: true

      t.timestamps
    end
    add_index :tasks, :project_id
  end
end
