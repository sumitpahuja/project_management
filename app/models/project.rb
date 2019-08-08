class Project < ApplicationRecord
  #all associations
  has_many :tasks, dependent: :destroy

  #all validations

  validates :name, :start_date, presence: true
  
  enum status: [:pending, :inprogress, :completed]
end
