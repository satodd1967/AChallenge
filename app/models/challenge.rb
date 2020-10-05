class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_users
  has_many :users, through: :challenge_users
  has_many :logs, through: :users
  has_many :challenge_goals, through: :users
end
