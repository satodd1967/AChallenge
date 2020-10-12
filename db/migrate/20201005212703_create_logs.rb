class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :log_date
      t.boolean :worked_out
      t.boolean :tracked_food
      t.float :weight
      t.float :body_fat
      t.integer :active_calories
      t.integer :calories
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
