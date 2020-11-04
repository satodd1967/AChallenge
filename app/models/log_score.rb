class LogScore < ApplicationRecord
  belongs_to :log
  belongs_to :challenge_goal

  def logic
    if self.log.worked_out == true
       self.points_worked_out = self.challenge_goal.challenge.points_worked_out
   else
       self.points_worked_out = 0
   end
   if self.log.tracked_food == true
       self.points_tracked_food = self.challenge_goal.challenge.points_tracked_food
   else
       self.points_tracked_food = 0
   end
   if self.log.calories <= self.challenge_goal.start_calorie_goal
       self.points_met_calorie_goal = self.challenge_goal.challenge.points_met_calorie_goal
   else
       self.points_met_calorie_goal = 0
   end
   if self.log.weight <= self.challenge_goal.start_weight
       self.points_maintain_weight = self.challenge_goal.challenge.points_maintain_weight
   else
       self.points_maintain_weight = 0
   end
   if self.log.body_fat <= self.challenge_goal.start_body_fat
       self.points_maintain_body_fat = self.challenge_goal.challenge.points_maintain_body_fat
   else
       self.points_maintain_body_fat = 0
   end
   if self.log.active_calories >= self.challenge_goal.challenge.active_calorie_goal
       self.points_met_active_calorie_goal = self.challenge_goal.challenge.points_met_active_calorie_goal
   else
       self.points_met_active_calorie_goal = 0
   end
   self.total_points = [
       self.points_worked_out,
       self.points_tracked_food,
       self.points_met_calorie_goal,
       self.points_maintain_weight,
       self.points_maintain_body_fat,
       self.points_met_active_calorie_goal
   ].sum
   self.save
  end

end
