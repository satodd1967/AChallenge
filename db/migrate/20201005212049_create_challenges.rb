class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.string :start_date
      t.integer :duration
      t.string :end_date
      t.integer :active_calorie_goal
      t.integer :points_worked_out
      t.integer :points_tracked_food
      t.integer :points_met_calorie_goal
      t.integer :points_maintain_weight
      t.integer :points_maintain_body_fat
      t.integer :points_met_active_calorie_goal
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
