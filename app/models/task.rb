class Task < ApplicationRecord
  #all associations
  belongs_to :project
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id'



  enum status: [:unstarted, :inprogress, :completed, :rejected, :accepted]
end
