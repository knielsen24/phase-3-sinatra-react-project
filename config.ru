require_relative "./config/environment"

# Allow CORS (Cross-Origin Resource Sharing) requests
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
  end
end

# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser

# Our application
run UserController
use WorkoutPlanController
use ExerciseController
use ExerciseSetController



# 1. lsof -i :<PORT NUMBER> (i.e. lsof -i :3000)
# 2. Obtain the unique PID (process identifier) from lsof -i output
# 3. kill -QUIT <PID> (i.e. kill -QUIT 4091)
