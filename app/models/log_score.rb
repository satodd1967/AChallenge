class LogScore < ApplicationRecord
  belongs_to :log
  belongs_to :challenge_goal

  def log_show_attributes
    self.log.attributes.select {|k, v| k != "id" &&
     k != "created_at" &&
      k != "updated_at" &&
      k != "user_id"
    }
  end

end
