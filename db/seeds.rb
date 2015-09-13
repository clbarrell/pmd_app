# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#5.times do |i|
#  Product.create(name: "Product ##{i}", description: "A product.")
#end


# Clients > 'subgroup' > Contacts

c1 = Client.create(name: Faker::Company.name)
c2 = Client.create(name: Faker::Company.name)
group1 = Client.create(name: Faker::Commerce.department, organisation_id: c1.id)

contact1 = Contact.create(name: Faker::Name.name, client_id: c1.id)
contact2 = Contact.create(name: Faker::Name.name, client_id: c2.id)
contact3 = Contact.create(name: Faker::Name.name, client_id: group1.id)

# Users

user1 = User.create(name: "Chris Barrell", email: "clbarrell@gmail.com",
  initials: "CLB", admin: true, password: "foobar000", password_confirmation: "foobar000")
user2 = User.create(name: Faker::Name.name, email: Faker::Internet.email,
  initials: Faker::Lorem.characters(3), admin: false, password: "aaaaaaaa", password_confirmation: "aaaaaaaa")
user3 = User.create(name: Faker::Name.name, email: Faker::Internet.email,
  initials: Faker::Lorem.characters(3), admin: false, password: "aaaaaaaa", password_confirmation: "aaaaaaaa")
user4 = User.create(name: Faker::Name.name, email: Faker::Internet.email,
  initials: Faker::Lorem.characters(3), admin: false, password: "aaaaaaaa", password_confirmation: "aaaaaaaa")

# Project

project1 = Project.create(name: "Leadership Workshop", job_number: 0001, total: 12978, probability: 50,
  service_line: "Leadership", status: "Active", project_type: "Proposal", suitable_reference: true,
  client_id: c1.id, contact_id: contact1.id)

project2 = Project.create(name: "Wellbeing Project", job_number: 0002, total: 4928, probability: 50,
  service_line: "Leadership", status: "Active", project_type: "Proposal", suitable_reference: false,
  client_id: c2.id, contact_id: contact2.id)

project3 = Project.create(name: "Change Woop Project", job_number: 0003, total: 978, probability: 50,
  service_line: "Transformation", status: "Complete", project_type: "Proposal", suitable_reference: true,
  client_id: group1.id, contact_id: contact3.id)

# Project Splits

split1 = ProjectSplit.create(user_id: user1, project_id: project1, role: "Sales", percentage: 50)
split2 = ProjectSplit.create(user_id: user2, project_id: project1, role: "Sales", percentage: 50)
split3 = ProjectSplit.create(user_id: user3, project_id: project1, role: "Coordinator")

split4 = ProjectSplit.create(user_id: user1, project_id: project2, role: "Sales", percentage: 70)
split5 = ProjectSplit.create(user_id: user2, project_id: project2, role: "Sales", percentage: 30)
split6 = ProjectSplit.create(user_id: user4, project_id: project2, role: "Involved")
split7 = ProjectSplit.create(user_id: user1, project_id: project2, role: "Coordinator")

split4 = ProjectSplit.create(user_id: user3, project_id: project3, role: "Sales", percentage: 60)
split5 = ProjectSplit.create(user_id: user2, project_id: project3, role: "Sales", percentage: 40)
split6 = ProjectSplit.create(user_id: user4, project_id: project3, role: "Involved")
split7 = ProjectSplit.create(user_id: user1, project_id: project3, role: "Coordinator")