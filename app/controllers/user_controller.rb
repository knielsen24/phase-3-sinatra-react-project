class UserController < Sinatra::Base
	set :default_content_type, 'application/json'
	#--------------Users--------------#

	get '/users/:id' do
		user = User.find(params[:id])
		user.to_json(include: { workout_plans: { include: :exercises } })
	end

	post '/users/login' do
		user = User.all.find_by(email:params[:email])
		user.to_json
		# email:params[:email], password:params[:password], loggedin:params[:loggedin]
	end

	post '/users' do
		user = User.create(
			username:params[:username],
			email:params[:email],
			first_name:params[:first_name],
			last_name:params[:last_name],
			phone:params[:phone],
			password:params[:password]
		)
		user.to_json
	end

	patch '/users/:id' do
		user = User.find(params[:id])
		user.update(
			username:params[:username],
			email:params[:email],
			first_name:params[:first_name],
			last_name:params[:last_name],
			phone:params[:phone],
			password:params[:password],
			loggedin:params[:loggedin]
		)
		user.to_json
	end

	patch '/login/users/:id' do
		user = User.find(params[:id])
		user.update(loggedin:params[:loggedin])
		user.to_json
	end

	delete '/users/:id' do
		user = User.find(params[:id])
		user.destroy
		user.to_json
	end
end
