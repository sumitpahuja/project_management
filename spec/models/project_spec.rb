require 'rails_helper'

RSpec.describe Project, :type => :model do
  it "should not create project without name" do
    project = Project.create(start_date: Date.today + 4.days)
    expect(project.errors.count).to be > 0
  end

  it "should not create project without start_date" do
    project = Project.create(name: 'database optimization')
    expect(project.errors.count).to be > 0
  end  
end