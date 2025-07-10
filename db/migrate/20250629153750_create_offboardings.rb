class CreateOffboardings < ActiveRecord::Migration[8.0]
  def change
    create_table :offboardings do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :due_date
      t.string :status
      t.references :created_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
