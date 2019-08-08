class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # associations
  has_and_belongs_to_many :projects, join_table: 'developers_projects', association_foreign_key: 'project_id', foreign_key: 'developer_id'       

end
