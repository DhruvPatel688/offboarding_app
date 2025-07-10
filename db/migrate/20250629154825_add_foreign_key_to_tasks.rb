class AddForeignKeyToTasks < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :tasks, :offboardings
  end
end
