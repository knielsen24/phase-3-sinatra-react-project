class CreateExerciseSets < ActiveRecord::Migration[6.1]
	def change
		create_table :exercise_sets do |t|
			t.integer :reps
			t.integer :weight
			t.belongs_to :exercise
			t.belongs_to :workout_plan
			t.timestamps
		end
	end
end
