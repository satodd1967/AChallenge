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
      t.integer :points_worked_out
      t.integer :points_tracked_food
      t.integer :points_met_calorie_goal
      t.integer :points_maintain_weight
      t.integer :points_maintain_body_fat
      t.integer :points_met_active_calorie_goal
      t.integer :total_points
      t.belongs_to :user, null: false, foreign_key: true
      # t.belongs_to :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
