class User < ApplicationRecord
    has_many :owned_challenges, foreign_key: "user_id", class_name: "Challenge"
    has_many :logs
    has_many :comments
    has_many :commented_logs, through: :comments, source: :log
    has_many :challenge_goals
    has_many :challenges, through: :challenge_goals

    has_secure_password

    def participating_challenges
        self.challenges.each do |challenge|
            challenge.challenge_goals.where(user: self)
        end
    end

end
