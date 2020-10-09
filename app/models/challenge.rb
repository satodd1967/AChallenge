class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_goals
  has_many :users, through: :challenge_goals
  
end
