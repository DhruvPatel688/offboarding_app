class Offboarding < ApplicationRecord
  belongs_to :employee
  belongs_to :created_by, class_name: "User"
  has_many :tasks, dependent: :destroy
  after_create :create_default_tasks
  has_many :assets

  STATUSES = %w[pending in_progress completed canceled]

  def completion_percentage
    return 0 if tasks.count == 0
    completed = tasks.where(status: "completed").count
    (completed.to_f / tasks.count * 100).round
  end
  validates :due_date, :status, presence: true
  scope :in_progress, -> { where(status: "in_progress") }
  scope :due_soon, -> { where("due_date < ?", Date.today + 7.days) }
  private

  # app/models/offboarding.rb
  def create_default_tasks
    DefaultTaskTemplate.where(department: employee.department).each do |template|
      tasks.create(title: template.title, assigned_to: template.assigned_to)
      puts "Task created: #{template.title}" # Add this line to see if tasks are being created
    end
  end
end
