class Task < ApplicationRecord
  #all associations
  belongs_to :project
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id', optional: true


  ADMIN_STATUS = %w[unstarted inprogress completed rejected accepted].freeze
  DEVELOPER_STATUS = %w[inprogress completed].freeze
  enum status: [:unstarted, :inprogress, :completed, :rejected, :accepted]
end
