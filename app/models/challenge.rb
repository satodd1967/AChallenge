class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_goals
  has_many :users, through: :challenge_goals
  has_many :log_scores, through: :challenge_goals

  def challenge_owner
    self.user
  end
  
end
