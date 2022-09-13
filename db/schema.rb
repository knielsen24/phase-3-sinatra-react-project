# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_20_154649) do

  create_table "exercise_sets", force: :cascade do |t|
    t.integer "reps"
    t.integer "weight"
    t.integer "exercise_id"
    t.integer "workout_plan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id"
    t.index ["workout_plan_id"], name: "index_exercise_sets_on_workout_plan_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "equipment"
    t.string "muscle_group"
    t.string "movement_type"
    t.string "training_zone"
    t.integer "workout_plan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["workout_plan_id"], name: "index_exercises_on_workout_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.string "phone"
    t.string "first_name"
    t.string "last_name"
    t.boolean "loggedin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workout_plans", force: :cascade do |t|
    t.string "name"
    t.integer "phase"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_workout_plans_on_user_id"
  end

end
