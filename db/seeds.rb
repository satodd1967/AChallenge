# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
kris = User.create(email: "kris@google.com", password: "Kris1!", username: "kris")
tim = User.create(email: "tim@google.com", password: "Tim1!", username: "tim")
patrick = User.create(email: "patrick@google.com", password: "Patrick1!", username: "patrick")
joe = User.create(email: "joe@google.com", password: "Joe1!", username: "joe")

# User Logs
krisl1 = Log.create(log_date: (Date.current + 1).to_s, worked_out: "1", tracked_food: "1", weight: "134.57", body_fat: ".2275", active_calories: "600", calories: "2200", user: kris)
krisl3 = Log.create(log_date: (Date.current + 2).to_s, worked_out: "0", tracked_food: "1", weight: "132.57", body_fat: ".2075", active_calories: "800", calories: "2500", user: kris)
krisl2 = Log.create(log_date: (Date.current + 3).to_s, worked_out: "0", tracked_food: "0", weight: "133.57", body_fat: ".2175", active_calories: "700", calories: "2300", user: kris)
timl1 = Log.create(log_date: (Date.current + 1).to_s, worked_out: "1", tracked_food: "1", weight: "165.57", body_fat: ".2575", active_calories: "300", calories: "3200", user: tim)
timl2 = Log.create(log_date: (Date.current + 2).to_s, worked_out: "0", tracked_food: "1", weight: "164.57", body_fat: ".25", active_calories: "400", calories: "3200", user: tim)
timl3 = Log.create(log_date: (Date.current + 3).to_s, worked_out: "1", tracked_food: "0", weight: "163.57", body_fat: ".2475", active_calories: "500", calories: "3200", user: tim)
patrickl1 = Log.create(log_date: (Date.current + 13).to_s, worked_out: "1", tracked_food: "1", weight: "185.57", body_fat: ".2975", active_calories: "600", calories: "3200", user: patrick)
patrickl2 = Log.create(log_date: (Date.current + 14).to_s, worked_out: "0", tracked_food: "1", weight: "184.57", body_fat: ".2875", active_calories: "600", calories: "3200", user: patrick)
patrickl3 = Log.create(log_date: (Date.current + 15).to_s, worked_out: "1", tracked_food: "0", weight: "183.57", body_fat: ".2775", active_calories: "600", calories: "3200", user: patrick)
joel1 = Log.create(log_date: (Date.current + 31).to_s, worked_out: "1", tracked_food: "1", weight: "185.57", body_fat: ".2975", active_calories: "600", calories: "3200", user: joe)
joel2 = Log.create(log_date: (Date.current + 32).to_s, worked_out: "0", tracked_food: "1", weight: "184.57", body_fat: ".2875", active_calories: "600", calories: "3200", user: joe)
joel3 = Log.create(log_date: (Date.current + 33).to_s, worked_out: "1", tracked_food: "1", weight: "183.57", body_fat: ".2775", active_calories: "600", calories: "3200", user: joe)

# Challenge 1
c1 = Challenge.create(name: "Kris's Fat Buster Challenge", description: "Busting fat before fat busting was cool", start_date: (Date.current + 1).to_s, duration: "2", active_calorie_goal: "300", points_worked_out: "10", points_tracked_food: "10", points_met_calorie_goal: "10", points_maintain_weight: "10", points_maintain_body_fat: "10", points_met_active_calorie_goal: "10", user: kris)
    # Set Challenge End Date
    c1.end_date = (c1.start_date.to_date + (c1.duration*7))
    c1.save
    # Challenge Gaols
    krisCg1 = ChallengeGoal.create(start_weight: "135.5", start_body_fat: ".2323", start_calorie_goal: "2300", user: kris, challenge: c1)
    timCg1 = ChallengeGoal.create(start_weight: "175.2", start_body_fat: ".2545", start_calorie_goal: "3000", user: tim, challenge: c1)
    patrickCg1 = ChallengeGoal.create(start_weight: "185.8", start_body_fat: ".2745", start_calorie_goal: "3100", user: patrick, challenge: c1)
    joeCg1 = ChallengeGoal.create(start_weight: "233.5", start_body_fat: ".3033", start_calorie_goal: "3500", user: joe, challenge: c1)

# Challenge 2
c2 = Challenge.create(name: "The Humiliation Challenge", description: "Everyone is going to see what you did ;)", start_date: (Date.current + 16).to_s, duration: "2", active_calorie_goal: "250", points_worked_out: "15", points_tracked_food: "15", points_met_calorie_goal: "15", points_maintain_weight: "20", points_maintain_body_fat: "10", points_met_active_calorie_goal: "10", user: kris)
    # Set Challenge End Date
    c2.end_date = (c2.start_date.to_date + (c2.duration*7))
    c2.save
    # Challenge Goals
    krisCg2 = ChallengeGoal.create(start_weight: "135.5", start_body_fat: ".2323", start_calorie_goal: "2300", user: kris, challenge: c2)
    timCg2 = ChallengeGoal.create(start_weight: "175.2", start_body_fat: ".2545", start_calorie_goal: "3000", user: tim, challenge: c2)
    patrickCg2 = ChallengeGoal.create(start_weight: "185.8", start_body_fat: ".2745", start_calorie_goal: "3100", user: patrick, challenge: c2)

# Challenge 3
c3 = Challenge.create(name: "Tim's Body Fat Liquidator", description: "The way of the Samurai", start_date: (Date.current + 30).to_s, duration: "6", active_calorie_goal: "400", points_worked_out: "20", points_tracked_food: "15", points_met_calorie_goal: "15", points_maintain_weight: "10", points_maintain_body_fat: "10", points_met_active_calorie_goal: "10", user: tim)
    #Set Challenge End Date
    c3.end_date = (c3.start_date.to_date + (c3.duration*7))
    c3.save
    # Challenge Goals
    krisCg3 = ChallengeGoal.create(start_weight: "135.5", start_body_fat: ".2323", start_calorie_goal: "2300", user: kris, challenge: c3)
    timCg3 = ChallengeGoal.create(start_weight: "175.2", start_body_fat: ".2545", start_calorie_goal: "3000", user: tim, challenge: c3)

Log.all.each do |log|
    log.user.challenge_goals.each do |cg|
        if log.log_date >= cg.challenge.start_date && log.log_date <= cg.challenge.end_date
            @ls = cg.log_scores.build
            @ls.log_id = log.id
            if @ls.log.worked_out == true
                @ls.points_worked_out = @ls.challenge_goal.challenge.points_worked_out
            else
                @ls.points_worked_out = 0
            end
            if @ls.log.tracked_food == true
                @ls.points_tracked_food = @ls.challenge_goal.challenge.points_tracked_food
            else
                @ls.points_tracked_food = 0
            end
            if @ls.log.calories <= @ls.challenge_goal.start_calorie_goal
                @ls.points_met_calorie_goal = @ls.challenge_goal.challenge.points_met_calorie_goal
            else
                @ls.points_met_calorie_goal = 0
            end
            if @ls.log.weight <= @ls.challenge_goal.start_weight
                @ls.points_maintain_weight = @ls.challenge_goal.challenge.points_maintain_weight
            else
                @ls.points_maintain_weight = 0
            end
            if @ls.log.body_fat <= @ls.challenge_goal.start_body_fat
                @ls.points_maintain_body_fat = @ls.challenge_goal.challenge.points_maintain_body_fat
            else
                @ls.points_maintain_body_fat = 0
            end
            if @ls.log.active_calories >= @ls.challenge_goal.challenge.active_calorie_goal
                @ls.points_met_active_calorie_goal = @ls.challenge_goal.challenge.points_met_active_calorie_goal
            else
                @ls.points_met_active_calorie_goal = 0
            end
            @ls.total_points = [
                @ls.points_worked_out,
                @ls.points_tracked_food,
                @ls.points_met_calorie_goal,
                @ls.points_maintain_weight,
                @ls.points_maintain_body_fat,
                @ls.points_met_active_calorie_goal
            ].sum
            @ls.save
        end
    end
end

