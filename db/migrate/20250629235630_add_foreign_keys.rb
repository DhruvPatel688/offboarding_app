class AddForeignKeys < ActiveRecord::Migration[8.0]
  def change
    unless column_exists?(:offboardings, :employee_id)
      add_reference :offboardings, :employee, foreign_key: true
    end

    unless column_exists?(:tasks, :offboarding_id)
      add_reference :tasks, :offboarding, foreign_key: true
    end

    unless column_exists?(:task_histories, :task_id)
      add_reference :task_histories, :task, foreign_key: true
    end

    unless column_exists?(:task_histories, :user_id)
      add_reference :task_histories, :user, foreign_key: true
    end

    unless column_exists?(:assets, :offboarding_id)
      add_reference :assets, :offboarding, foreign_key: true
    end
  end
end
