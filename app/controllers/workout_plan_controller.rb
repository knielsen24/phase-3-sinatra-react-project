class WorkoutPlanController < Sinatra::Base
set :default_content_type, 'application/json'

	get '/workout_plans/all/users/:id' do
		workout_plans = WorkoutPlan.where("user_id == #{params[:id]}").order(:created_at).reverse
		workout_plans.to_json(include: { exercises: { include: :exercise_sets } })
	end

	get '/workout_plans/:id' do
		workout_plan = WorkoutPlan.find(params[:id])
		workout_plan.to_json(include: { exercises: { include: :exercise_sets } })
	end

	post '/workout_plans' do
		workout_plan = WorkoutPlan.create(
			user_id:params[:user_id],
			name:params[:name],
			phase:params[:phase],
			id:params[:id]
		)
		workout_plan.to_json
	end

	patch '/workout_plans/:id' do
		workout_plan = WorkoutPlan.find(params[:id])
		workout_plan.update(user_id:params[:user_id])
		workout_plan.to_json
	end

	delete '/workout_plans/:id' do
		workout_plan = WorkoutPlan.find(params[:id])
		workout_plan.destroy
		workout_plan.to_json
	end
end
