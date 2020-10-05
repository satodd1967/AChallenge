class CreateChallengeGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :challenge_goals do |t|
      t.float :start_weight
      t.float :start_body_fat
      t.integer :start_calorie_goal
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
