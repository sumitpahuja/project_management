class User < ApplicationRecord
  rolify
  ROLES = %w[admin developer].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # associations
  has_and_belongs_to_many :projects, join_table: 'developers_projects', association_foreign_key: 'project_id', foreign_key: 'developer_id'  

  has_many :tasks, foreign_key: 'developer_id'  


  #callbacks
  after_create :assign_default_role


  # metaprogramming to find users role wise and their count
  ROLES.each do |role|
    scope "#{role.downcase}s", -> { Role.find_by_name(role).users rescue [] }
    scope "#{role.downcase}_count", -> { Role.find_by_name(role).users.count rescue 0 }
  end  

  def self.developer_names(devs = developers)
    (devs.all.pluck(:id, :fullname).map { |id, fullname| { id => fullname } }).inject(:merge)
  end


  def role_name
    roles.first.try(:name)
  end

  private

  def assign_default_role
    self.add_role(:developer) if self.roles.blank?
  end  

end
