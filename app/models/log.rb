class Log < ApplicationRecord
  belongs_to :user
  has_many :log_scores
end
