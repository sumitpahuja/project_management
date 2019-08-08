class CreateJoinTableDevelopersProjects < ActiveRecord::Migration[5.2]
  def change
    create_join_table :developers, :projects
    add_index :developers_projects, [:developer_id, :project_id]
  end
end
