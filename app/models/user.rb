class User < ApplicationRecord
    has_many :owned_challenges, foreign_key: "user_id", class_name: "Challenge"
    has_many :logs
    has_many :challenge_goals
    has_many :challenge_users
    has_many :challenges, through: :challenge_users

    has_secure_password

end
