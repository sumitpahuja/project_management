require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'correct roles' do
    it 'should add developer role as default role on creation' do
      user =  FactoryGirl.create :user
      user.has_role?(:developer).should == true
      user.role_name.should == 'developer'
    end
  end
end