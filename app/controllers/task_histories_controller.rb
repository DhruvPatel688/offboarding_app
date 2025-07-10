class TaskHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task

  def index
    @task_histories = @task.task_histories
  end

  private

  def set_task
    @task = current_user.offboardings.joins(:tasks)
                 .select("tasks.*")
                 .merge(Task.where(id: params[:task_id]))
                 .first

    unless @task
      redirect_to root_path, alert: "Task not found or not authorized"
    end
  end
end
