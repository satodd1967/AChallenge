class User < ApplicationRecord
    has_many :challenges
    has_many :logs
    has_many :challenge_goals
    has_many :challenge_users
    has_many :challenges, through: :challenge_users

    has_secure_password

end
