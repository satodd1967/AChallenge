class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_goals, :dependent => :destroy 
  has_many :users, through: :challenge_goals
  has_many :logs, through: :users
  has_many :log_scores, through: :challenge_goals

  def challenge_owner
    self.user
  end

  def logs
    self.log_scores.each do |ls|
      ls.log
    end
  end

  def ranking
    ChallengeGoal.where(challenge_id: self.id).joins(:log_scores).group(:challenge_goal_id).order('sum_total_points DESC').sum(:total_points)
  end 
  
end
