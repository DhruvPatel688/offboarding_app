# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "🌱 Seeding database..."

User.destroy_all
Employee.destroy_all
Offboarding.destroy_all
Task.destroy_all

user = User.create!(
  email: "demo@example.com",
  password: "password",
  password_confirmation: "password"
)

puts "👤 Created user: #{user.email}"

# Create employees
employees = [
  { first_name: "Alice", last_name: "Nguyen", email: "alice.nguyen@acme.com", department: "Finance", position: "Accountant" },
  { first_name: "Brad", last_name: "Johnson", email: "brad.johnson@acme.com", department: "IT", position: "Support Engineer" },
  { first_name: "Carmen", last_name: "Lopez", email: "carmen.lopez@acme.com", department: "Marketing", position: "Content Strategist" },
  { first_name: "Derek", last_name: "Chang", email: "derek.chang@acme.com", department: "Sales", position: "Account Executive" }
]

employees.each do |e|
  Employee.create!(e)
end

puts "👥 Created #{Employee.count} employees"

# Create offboardings
offboarding1 = Offboarding.create!(
  employee: Employee.first,
  due_date: 10.days.from_now,
  status: "in_progress",
  created_by: user
)

offboarding2 = Offboarding.create!(
  employee: Employee.last,
  due_date: 5.days.from_now,
  status: "pending",
  created_by: user
)

puts "📋 Created #{Offboarding.count} offboarding checklists"

# Add tasks to each offboarding
[
  { offboarding: offboarding1, title: "Revoke email access", status: "completed", assigned_to: "IT" },
  { offboarding: offboarding1, title: "Recover laptop", status: "in_progress", assigned_to: "IT" },
  { offboarding: offboarding1, title: "Conduct HR exit interview", status: "pending", assigned_to: "HR" },
  { offboarding: offboarding2, title: "Revoke CRM access", status: "pending", assigned_to: "Sales Ops" },
  { offboarding: offboarding2, title: "Deactivate badge", status: "pending", assigned_to: "Security" },
  { offboarding: offboarding2, title: "Collect feedback form", status: "pending", assigned_to: "HR" }
].each do |task_data|
  Task.create!(task_data)
end

puts "✅ Created #{Task.count} tasks"
puts "🎉 Done seeding!"
# db/seeds.rb
DefaultTaskTemplate.create([
  { department: 'IT', title: 'Disable account', assigned_to: 'IT' },
  { department: 'IT', title: 'Retrieve laptop', assigned_to: 'IT' },
  { department: 'HR', title: 'Conduct exit interview', assigned_to: 'HR' },
  { department: 'Finance', title: 'Process final paycheck', assigned_to: 'Finance' }
])
