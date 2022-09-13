class Exercise < ActiveRecord::Base
	belongs_to :workout_plan
	has_many :exercise_sets
end
