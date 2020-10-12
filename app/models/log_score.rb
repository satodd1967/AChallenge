class LogScore < ApplicationRecord
  belongs_to :log
  belongs_to :challenge_goal
end
