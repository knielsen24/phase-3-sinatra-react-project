class CreateExercises < ActiveRecord::Migration[6.1]
	def change
		create_table :exercises do |t|
			t.string :name
			t.string :equipment
			t.string :muscle_group
			t.string :movement_type
			t.string :training_zone
			t.belongs_to :workout_plan
			t.timestamps
		end

	end
end
