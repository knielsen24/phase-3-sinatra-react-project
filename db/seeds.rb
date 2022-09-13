puts "🌱 Seeding spices..."

day1 = DateTime.new(2022,6,10)
day2 = DateTime.new(2022,6,11)
day3 = DateTime.new(2022,6,12)
day4 = DateTime.new(2022,6,13)
day5 = DateTime.new(2022,6,14)

date_list = [day1, day2, day3, day4, day5]


first_user = User.create(
	username: "mrmai",
	email: "mrmai@gmail.com",
	phone: 8051234567,
	first_name: "mr",
	last_name: "mai",
	password: "1234"
)


date_list.each do |day|
	names = ["strength legs", "speed legs", "power back", "plyometric movement", "static strength"]
	phases = [1, 2]
	WorkoutPlan.create(name: names.sample, phase: phases[0], user_id: first_user.id)
end

# date_list.each do |day|
# 	names = ["strength legs", "speed legs", "power back", "plyometric movement", "static strength"]
# 	phases = ["phase 1", "phase 2"]
# 	WorkoutPlan.create(name: names.sample, phase: phases[1], user_id: first_user.id)
# end

WorkoutPlan.all.map do |workout|
	exercise_list = ["squat", "romanian deadlift", "push up", "pull up", "plank", "box jump" ]
	equipment_list = ["body weight", "barbell", "dumbbell", "kettlebell", "loop band", "stretch band", "plate" ]
	muscle_group = ["legs", "arms", "back","glutes", "bis", "tris", "calves", "obliques", "abdominals"]
	movement_type = ["warm up", "static", "speed", "power", "strength", "endurance"]
	training_zone = ["recovery / 55-65% HR max", "aerobic / 65-75% HR max", "tempo / 80-85% HR max", "lactate threshold / 85-89% HR max", "anaerobic 90% + HR max"]

	3.times do
		Exercise.create(
		name: exercise_list.sample,
		equipment: equipment_list.sample,
		muscle_group: muscle_group.sample,
		movement_type: movement_type.sample,
		training_zone: training_zone.sample,
		workout_plan_id: workout.id
		)
	end
end


Exercise.all.map do |exercise|
	workout_plan_id = WorkoutPlan.ids.sample
	4.times do
		ExerciseSet.create(
			reps: 5,
			weight: 10,
			exercise_id: exercise.id,
			workout_plan_id: workout_plan_id
		)
	end
end

# "back squat", "front squat", "forward lunge", "reverse lunge", "deadlift", "romanian deadlift (RDL)", "pistol squat"


puts "✅ Done seeding!"
