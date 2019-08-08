class Project < ApplicationRecord
  #all associations
  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :team_members, class_name: 'User', join_table: 'developers_projects', association_foreign_key: 'developer_id'

  #scopes
  scope :incompleted,   ->{ where.not(status: 'completed') }

  #all validations
  validates :name, :start_date, presence: true
  
  enum status: [:pending, :inprogress, :completed]
end
