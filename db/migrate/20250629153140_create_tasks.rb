class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.references :offboarding, null: false
      t.string :title
      t.string :status
      t.string :assigned_to
      t.text :notes

      t.timestamps
    end
  end
end
