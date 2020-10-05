class CreateChallengeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :challenge_users do |t|
      t.belongs_to :challenge, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
