class CreateWorkoutPlans < ActiveRecord::Migration[6.1]
	def change
		create_table :workout_plans do |t|
			t.string :name
			t.integer :phase
			t.belongs_to :user
			t.timestamps
		end

	end
end
