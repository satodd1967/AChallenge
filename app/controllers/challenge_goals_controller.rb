class ChallengeGoalsController < ApplicationController

    def new
        binding.pry
        @challenge_goal = ChallengeGoal.new

    end

end
