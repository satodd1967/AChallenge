# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
kris = User.create(email: "kris@google.com", password: "kris1", username: "kris")
    # Challenge Logs
    krisl1 = Log.create(log_date: "2020-20-05", worked_out: "1", tracked_food: "1", weight: "134.57", body_fat: ".22.75", active_calories: "600", calories: "2200", user: kris)
    krisl2 = Log.create(log_date: "2020-20-06", worked_out: "0", tracked_food: "0", weight: "133.57", body_fat: ".21.75", active_calories: "700", calories: "2300", user: kris)
    krisl3 = Log.create(log_date: "2020-20-07", worked_out: "0", tracked_food: "1", weight: "132.57", body_fat: ".20.75", active_calories: "800", calories: "2500", user: kris)
        # Log Comments
        kriscl1 = Comment.create(content: "Nice Job" user: tim, log: krisl1)
        kriscl2 = Comment.create(content: "Even Better Job" user: tim, log: krisl2)
        kriscl3 = Comment.create(content: "Great Job Kris" user: patrick log: krisl3)
tim = User.create(email: "tim@google.com", password: "tim1", username: "tim")
    # Challenge Logs
    timl1 = Log.create(log_date: "2020-20-05", worked_out: "1", tracked_food: "1", weight: "165.57", body_fat: ".25.75", active_calories: "300", calories: "3200", user: tim)
    timl2 = Log.create(log_date: "2020-20-06", worked_out: "0", tracked_food: "1", weight: "164.57", body_fat: ".25", active_calories: "400", calories: "3200", user: tim)
    timl3 = Log.create(log_date: "2020-20-07", worked_out: "1", tracked_food: "0", weight: "163.57", body_fat: ".24.75", active_calories: "500", calories: "3200", user: tim)
        # Log Comments
        timcl1 = Comment.create(content: "Nice Job Timmy" user: kris log: timl1)
        timcl3 = Comment.create(content: "Way to go Timmay" user: joe log: timl3)
patrick = User.create(email: "patrick@google.com", password: "patrick1", username: "patrick")
    # Challenge Logs
    patrickl1 = Log.create(log_date: "2020-20-05", worked_out: "1", tracked_food: "1", weight: "185.57", body_fat: ".29.75", active_calories: "600", calories: "3200", user: patrick)
    patrickl2 = Log.create(log_date: "2020-20-06", worked_out: "0", tracked_food: "1", weight: "184.57", body_fat: ".28.75", active_calories: "600", calories: "3200", user: patrick)
    patrickl3 = Log.create(log_date: "2020-20-07", worked_out: "1", tracked_food: "0", weight: "183.57", body_fat: ".27.75", active_calories: "600", calories: "3200", user: patrick)
        # Log Comments
        patrickcl1 = Comment.create(content: "You Suck Patrick!!" user: tim log: patrickl1)
joe = User.create(email: "joe@google.com", password: "joe1", username: "joe")
    # Challenge Logs
    joel1 = Log.create(log_date: "2020-20-05", worked_out: "1", tracked_food: "1", weight: "185.57", body_fat: ".29.75", active_calories: "600", calories: "3200", user: joe)
    joel2 = Log.create(log_date: "2020-20-06", worked_out: "0", tracked_food: "1", weight: "184.57", body_fat: ".28.75", active_calories: "600", calories: "3200", user: joe)
    joel3 = Log.create(log_date: "2020-20-07", worked_out: "1", tracked_food: "1", weight: "183.57", body_fat: ".27.75", active_calories: "600", calories: "3200", user: joe)

# Challenge 1
c1 = Challenge.create(name: "challenge1", description: "Allot of stuff about Challenge1 and how its the best challenge ever", start_date: "2020-10-05", duration: "5", end_date: "2020-11-02", active_calorie_goal: "300", points_worked_out: "10", points_tracked_food: "10", points_met_calorie_goal: "10", points_maintain_weight: "10", points_maintain_body_fat: "10", points_met_active_calorie_goal: "10", user: kris)
    # Challenge Gaols
    krisCg1 = ChallengeGoal.create(start_weight: "135.5", start_body_fat: ".2323", start_calorie_goal: "2300", user: kris, challenge: c1)
    timCg1 = ChallengeGoal.create(start_weight: "175.2", start_body_fat: ".2545", start_calorie_goal: "3000", user: tim, challenge: c1)
    patrickCg1 = ChallengeGoal.create(start_weight: "185.8", start_body_fat: ".2745", start_calorie_goal: "3100", user: patrick, challenge: c1)
    joeCg1 = ChallengeGoal.create(start_weight: "233.5", start_body_fat: ".3033", start_calorie_goal: "3500", user: joe, challenge: c1)

# Challenge 2
c2 = Challenge.create(name: "challenge2", description: "Allot of stuff about challenge 2 and how its the 2nd best challenge ever", start_date: "2020-10-05", duration: "4", end_date: "2020-10-26", active_calorie_goal: "300", points_worked_out: "10", points_tracked_food: "10", points_met_calorie_goal: "10", points_maintain_weight: "10", points_maintain_body_fat: "10", points_met_active_calorie_goal: "10", user: kris)
    # Challenge Goals
    krisCg2 = ChallengeGoal.create(start_weight: "135.5", start_body_fat: ".2323", start_calorie_goal: "2300", user: kris, challenge: c2)
    timCg2 = ChallengeGoal.create(start_weight: "175.2", start_body_fat: ".2545", start_calorie_goal: "3000", user: tim, challenge: c2)
    patrickCg2 = ChallengeGoal.create(start_weight: "185.8", start_body_fat: ".2745", start_calorie_goal: "3100", user: patrick, challenge: c2)

# Challenge 3
c3 = Challenge.create(name: "challenge3", description: "Allot of stuff about challenge 3 and how its the 3rd best challenge ever", start_date: "2020-10-05", duration: "6", end_date: "2020-11-09", active_calorie_goal: "300", points_worked_out: "10", points_tracked_food: "10", points_met_calorie_goal: "10", points_maintain_weight: "10", points_maintain_body_fat: "10", points_met_active_calorie_goal: "10", user: tim)
    # Challenge Goals
    krisCg3 = ChallengeGoal.create(start_weight: "135.5", start_body_fat: ".2323", start_calorie_goal: "2300", user: kris, challenge: c3)
    timCg3 = ChallengeGoal.create(start_weight: "175.2", start_body_fat: ".2545", start_calorie_goal: "3000", user: tim, challenge: c3)


