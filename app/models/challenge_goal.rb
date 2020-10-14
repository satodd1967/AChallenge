class ChallengeGoal < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :log_scores, :dependent => :destroy
end
