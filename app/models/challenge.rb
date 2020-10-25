class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_goals, :dependent => :destroy 
  has_many :users, through: :challenge_goals
  has_many :logs, through: :users
  has_many :log_scores, through: :challenge_goals

  validates_presence_of attribute_names.select {
    |attr| attr != "id" &&
     attr != "created_at" &&
      attr != "updated_at" &&
       attr != "end_date"
      }
  validates :name, uniqueness: true
  validates :description, length: { maximum: 75 }
  validate :not_in_past
  validates :duration, numericality: { less_than: 30 }
  
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

  def not_in_past
    if self.start_date < Date.current.to_s
      errors.add(:start_date, "cannot be in the past" )
    end
  end
  
end
