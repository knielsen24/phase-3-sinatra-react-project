class ExerciseSetController < Sinatra::Base
	set :default_content_type, 'application/json'
	#--------------Excercise Sets--------------#

	post '/exercises/:id/sets' do
		exercise_set = ExerciseSet.create(
			reps:params[:reps],
			weight:params[:weight],
			timed:params[:timed],
			exercise_id:params[:id]
		)
		exercise_set.to_json
	end

	patch '/sets/:id' do
		exercise_set = ExerciseSet.find(params[:id])
		exercise_set.update(
			reps:params[:reps],
			weight:params[:weight],
			timed:params[:timed],
			exercise_id:params[:exercise_id]
		)
		exercise_set.to_json
	end

	delete '/sets/:id' do
		exercise_set = ExerciseSet.find(params[:id])
		exercise_set.destroy
	end


	# get '/exercises/:id/sets' do
	# 	exercise_sets = Exercise.find(params[:id]).exercise_sets.all
	# 	exercise_sets.to_json
	# end

end
