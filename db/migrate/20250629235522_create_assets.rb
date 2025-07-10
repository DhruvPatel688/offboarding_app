class CreateAssets < ActiveRecord::Migration[8.0]
  def change
    create_table :assets do |t|
      t.references :offboarding, null: false, foreign_key: true
      t.string :name
      t.boolean :returned
      t.string :condition
      t.text :notes

      t.timestamps
    end
  end
end
