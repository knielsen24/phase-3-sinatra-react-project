class ExerciseController < Sinatra::Base
	set :default_content_type, 'application/json'
	#--------------Excercises--------------#

	get '/workout_plans/:id/exercises' do
		exercises = WorkoutPlan.find(params[:id]).exercises.all
		exercises.to_json
	end

	post '/exercises' do
		# workout_plan_id = WorkoutPlan.find(params[:id])
		exercise = Exercise.create(
			name:params[:name],
			equipment:params[:equipment],
			muscle_group:params[:muscle_group],
			movement_type:params[:movement_type],
			training_zone:params[:training_zone],
			workout_plan_id:params[:workout_plan_id]
		)
		exercise.to_json
	end

	patch '/exercises/:id' do
		exercise = Exercise.find(params[:id])
		exercise.update(
			name:params[:name],
			equipment:params[:equipment],
			muscle_group:params[:muscle_group],
			movement_type:params[:movement_type],
			training_zone:params[:training_zone],
			workout_plan_id:params[:workout_plan_id]
		)
		exercise.to_json
	end

	delete '/exercises/:id' do
		exercise = Exercise.find(params[:id])
		exercise.destroy
	end

end
