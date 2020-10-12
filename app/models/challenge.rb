class Challenge < ApplicationRecord
  belongs_to :user
  has_many :log_scores
  has_many :challenge_goals
  has_many :users, through: :challenge_goals

  def challenge_owner
    self.user
  end
  
end
