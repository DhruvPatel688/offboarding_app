class Task < ApplicationRecord
  belongs_to :offboarding
  has_many :task_histories, dependent: :destroy

  STATUSES = [ "Not Started", "Pending", "In Progress", "Completed", "Blocked" ]

  validates :title, presence: true
  validates :status, inclusion: { in: STATUSES }



  def status_badge
    case status
    when "Completed" then "success"
    when "In Progress" then "info"
    when "Blocked"     then "danger"
    when "Pending"     then "warning"
    else "secondary"
    end
  end
end
