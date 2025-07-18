class CreateTaskHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :task_histories do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.text :notes

      t.timestamps
    end
  end
end
