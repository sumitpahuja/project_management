class Task < ApplicationRecord
  #all associations
  belongs_to :project



  enum status: [:unstarted, :inprogress, :completed, :rejected, :accepted]
end
