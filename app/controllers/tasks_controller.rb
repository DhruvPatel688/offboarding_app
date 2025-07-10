class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_offboarding
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def create
    @task = @offboarding.tasks.build(task_params)
    if @task.save
      redirect_to @offboarding, notice: "Task added."
    else
      redirect_to @offboarding, alert: "Could not add task."
    end
  end

  def update
    if @task.update(task_params)
      begin
        log_task_history(@task, "Updated task status from #{@task.status_was || 'None'} to #{@task.status}")
        OffboardingMailer.task_reminder_email(@task.offboarding.employee, @task).deliver_later
      rescue => e
        Rails.logger.error "Error updating task history or sending email: #{e.message}"
      end
      redirect_to @offboarding, notice: "Task updated."
    else
      Rails.logger.error "Task update failed: #{@task.errors.full_messages.join(', ')}"
      redirect_to @offboarding, alert: "Could not update task."
    end
  end

  def edit
    # @task is already set by set_task
  end

  def destroy
    @task.destroy
    redirect_to @offboarding, notice: "Task removed."
  end

  private

  def set_offboarding
    # Only find offboardings owned by current_user
    @offboarding = current_user.offboardings.find(params[:offboarding_id]) if params[:offboarding_id].present?
  end

  def set_task
    # Find task through current_user's offboardings to prevent unauthorized access
    @task = Task.joins(:offboarding)
                .where(offboardings: { created_by_id: current_user.id })
                .find(params[:id])
    @offboarding = @task.offboarding
  end

  def task_params
    params.require(:task).permit(:title, :status, :assigned_to, :notes)
  end

  def log_task_history(task, action)
    task.task_histories.create(user: current_user, action: action)
  end
end
