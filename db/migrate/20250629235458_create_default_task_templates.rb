class CreateDefaultTaskTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :default_task_templates do |t|
      t.string :department
      t.string :title
      t.string :assigned_to

      t.timestamps
    end
  end
end
