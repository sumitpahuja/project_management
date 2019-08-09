# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.find_by_email('admin@gmail.com').blank?
  u = User.new(email: 'admin@gmail.com', password: 123456, fullname: 'Louis Doul')
  u.add_role(:admin)
  u.save
end

if User.developers.count < 1
  (1..3).each do |i|
    User.create(email: Faker::Internet.email , password: 123456, fullname: Faker::Name.name )
  end
end

if Project.count < 1
  (1..2).each do |i|
    proj = Project.create(name: Faker::Company.industry, start_date: Date.today + 4.day)
    proj.team_member_ids = User.developers.collect(&:id)
  end
end

if Task.count < 1
  Project.all.each do |p|
    (1..3).each do |i|
      Task.create(name: Faker::Company.catch_phrase, project_id: p.id, developer_id: User.developers.sample.id)
    end    
  end
end