class ChallengeGoal < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  has_many :log_scores, :dependent => :destroy

  validates_presence_of attribute_names.select {
    |attr| attr != "id" &&
     attr != "created_at" &&
      attr != "updated_at" &&
       attr != "end_date"
      }
  validates :name, uniqueness: true
  validates :description, length: { maximum: 75 }
  validate :not_in_past
  validates :duration, numericality: { less_than: 30 }
  
end
