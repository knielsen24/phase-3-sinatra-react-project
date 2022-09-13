class WorkoutPlan < ActiveRecord::Base
	belongs_to :user
	has_many :exercises
	has_many :exercise_sets
	has_many :exercise_sets, through: :exercises
end
