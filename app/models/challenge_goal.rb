class ChallengeGoal < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :log_scores, :dependent => :destroy

  validates_presence_of attribute_names.select {
    |attr| attr != "id" &&
     attr != "created_at" &&
      attr != "updated_at" 
    }
  
  validates_numericality_of attribute_names.select {
    |attr| attr != "id" &&
     attr != "created_at" &&
      attr != "updated_at" 
    }, greater_than: 0 

    def cg_create_log_scores
      self.user.logs.each do |log|
        if log.log_date >= self.challenge.start_date && log.log_date <= self.challenge.end_date
            @ls = self.log_scores.build
            @ls.log_id = log.id
            if @ls.log.worked_out == true
                @ls.points_worked_out = @ls.challenge_goal.challenge.points_worked_out
            else
                @ls.points_worked_out = 0
            end
            if @ls.log.tracked_food == true
                @ls.points_tracked_food = @ls.challenge_goal.challenge.points_tracked_food
            else
                @ls.points_tracked_food = 0
            end
            if @ls.log.calories <= @ls.challenge_goal.start_calorie_goal
                @ls.points_met_calorie_goal = @ls.challenge_goal.challenge.points_met_calorie_goal
            else
                @ls.points_met_calorie_goal = 0
            end
            if @ls.log.weight <= @ls.challenge_goal.start_weight
                @ls.points_maintain_weight = @ls.challenge_goal.challenge.points_maintain_weight
            else
                @ls.points_maintain_weight = 0
            end
            if @ls.log.body_fat <= @ls.challenge_goal.start_body_fat
                @ls.points_maintain_body_fat = @ls.challenge_goal.challenge.points_maintain_body_fat
            else
                @ls.points_maintain_body_fat = 0
            end
            if @ls.log.active_calories >= @ls.challenge_goal.challenge.active_calorie_goal
                @ls.points_met_active_calorie_goal = @ls.challenge_goal.challenge.points_met_active_calorie_goal
            else
                @ls.points_met_active_calorie_goal = 0
            end
            @ls.total_points = [
                @ls.points_worked_out,
                @ls.points_tracked_food,
                @ls.points_met_calorie_goal,
                @ls.points_maintain_weight,
                @ls.points_maintain_body_fat,
                @ls.points_met_active_calorie_goal
            ].sum
            @ls.save
        end
      end
    end


end
