class OffboardingMailer < ApplicationMailer
  def task_reminder_email(employee, task)
    @employee = employee
    @task = task
    mail(to: @task.assigned_to, subject: "Task reminder: #{@task.title}")
  end

  def exit_survey_email(employee)
    @employee = employee
    mail(to: employee.email, subject: "Exit survey")
  end
end
