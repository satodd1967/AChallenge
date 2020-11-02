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
  validate :not_in_past, on: :create
  validates :duration, numericality: { less_than: 30 }

  def logs
    self.log_scores.each do |ls|
      ls.log
    end
  end

  def show_attributes
    self.attributes.select {|k, v| k != "id" &&
     k != "created_at" &&
      k != "updated_at" &&
       k != "name" &&
        k != "description" &&
         k != "start_date" &&
          k != "duration" &&
           k != "end_date" &&
           k != "user_id"
          }
  end

  def ranking
    ChallengeGoal.where(challenge_id: self.id).joins(:log_scores).group(:challenge_goal_id).order('sum_total_points DESC').sum(:total_points)
  end

  def user_rank(user_object)
    rank = self.ranking.keys.index(self.challenge_goals.find_by(user_id: user_object.id).id)
    if rank
      (rank.to_i + 1).ordinalize
    else
      "last"
    end
  end

  def rank_points(user_object)
    self.ranking[self.challenge_goals.find_by(user_id: user_object.id).id] ||= "0"
  end

  def should_be_ranked(user_object)
    self.users.include?(user_object) && self.ranking != {} && self.user_rank(user_object)
  end

  def participating(user_object)
    !self.users.include?(user_object)
  end

  def not_in_past
    if self.start_date < (Date.current - 1).to_s
      errors.add(:start_date, "cannot be in the past" )
    end
  end

  def has_goals(user_object)
    self.challenge_goals.where(user_id: user_object) != []
  end

  def find_user_challenge_goal(user_object)
    user_object.challenge_goals.find_by(challenge: self).id
  end
  
end
