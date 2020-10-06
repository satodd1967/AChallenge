# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
kris = User.create(email: "kris@google.com", password: "kris1", username: "kris")
tim = User.create(email: "tim@google.com", password: "tim1", username: "tim")
patrick = User.create(email: "patrick@google.com", password: "patrick1", username: "patrick")
joe = User.create(email: "joe@google.com", password: "joe1", username: "joe")

# Challenge 1
c1 = Challenge.create(name: "challenge1", start_date: "2020-10-05", duration: "5", end_date: "2020-11-02", active_calorie_goal: "300", points_worked_out: "10", points_tracked_food: "10", points_met_calorie_goal: "10", points_maintain_weight: "10", points_maintain_body_fat: "10", points_met_active_calorie_goal: "10", user: kris)
    # Building Join Table
    c1cu1 = ChallengeUser.create(challenge: c1, user: kris)
    c1cu2 = ChallengeUser.create(challenge: c1, user: tim)
    c1cu3 = ChallengeUser.create(challenge: c1, user: patrick)
    c1cu3 = ChallengeUser.create(challenge: c1, user: joe)
    # Challenge Gaols
    krisCg1 = ChallengeGoal.create(start_weight: "135.5", start_body_fat: ".2323", start_calorie_goal: "2300", user: kris, challenge: c1)
    timCg1 = ChallengeGoal.create(start_weight: "175.2", start_body_fat: ".2545", start_calorie_goal: "3000", user: tim, challenge: c1)
    patrickCg1 = ChallengeGoal.create(start_weight: "185.8", start_body_fat: ".2745", start_calorie_goal: "3100", user: patrick, challenge: c1)
    joeCg1 = ChallengeGoal.create(start_weight: "233.5", start_body_fat: ".3033", start_calorie_goal: "3500", user: joe, challenge: c1)

# Challenge 2
c2 = Challenge.create(name: "challenge2", start_date: "2020-10-05", duration: "4", end_date: "2020-10-26", active_calorie_goal: "300", points_worked_out: "10", points_tracked_food: "10", points_met_calorie_goal: "10", points_maintain_weight: "10", points_maintain_body_fat: "10", points_met_active_calorie_goal: "10", user: kris)
    # Building Join Table
    c2cu1 = ChallengeUser.create(challenge: c2, user: kris)
    c2cu2 = ChallengeUser.create(challenge: c2, user: tim)
    c2cu3 = ChallengeUser.create(challenge: c2, user: patrick)
    # Challenge Goals
    krisCg2 = ChallengeGoal.create(start_weight: "135.5", start_body_fat: ".2323", start_calorie_goal: "2300", user: kris, challenge: c2)
    timCg2 = ChallengeGoal.create(start_weight: "175.2", start_body_fat: ".2545", start_calorie_goal: "3000", user: tim, challenge: c2)
    patrickCg2 = ChallengeGoal.create(start_weight: "185.8", start_body_fat: ".2745", start_calorie_goal: "3100", user: patrick, challenge: c2)

# Challenge 3
c3 = Challenge.create(name: "challenge3", start_date: "2020-10-05", duration: "6", end_date: "2020-11-09", active_calorie_goal: "300", points_worked_out: "10", points_tracked_food: "10", points_met_calorie_goal: "10", points_maintain_weight: "10", points_maintain_body_fat: "10", points_met_active_calorie_goal: "10", user: tim)
    # Building Join Table
    c3cu1 = ChallengeUser.create(challenge: c3, user: kris)
    c3cu2 = ChallengeUser.create(challenge: c3, user: tim)
    # Challenge Goals
    krisCg3 = ChallengeGoal.create(start_weight: "135.5", start_body_fat: ".2323", start_calorie_goal: "2300", user: kris, challenge: c3)
    timCg3 = ChallengeGoal.create(start_weight: "175.2", start_body_fat: ".2545", start_calorie_goal: "3000", user: tim, challenge: c3)
    

