class User < ApplicationRecord
    has_many :owned_challenges, foreign_key: "user_id", class_name: "Challenge"
    has_many :logs
    has_many :log_scores, through: :logs
    has_many :challenge_goals
    has_many :challenges, through: :challenge_goals

    has_secure_password

    validates :username, presence: true
    validates :email, presence: true
    validates :email, exclusion: {in: User.all.map {|user| user.email},
        message: "%{value} is already in use." }
    validates :password, presence: true
    validates :password, format: { with: /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x,
        message: "must contain at least 8 characters, one lowercase, one upercase, one number and one symbol." }

end
