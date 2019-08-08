class AddColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :developer_id,  :integer
    add_index :tasks, :developer_id
  end
end
