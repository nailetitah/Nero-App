# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_03_221252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trainings", force: :cascade do |t|
    t.datetime "start_date"
    t.integer "duration", default: 172800
    t.string "title"
    t.text "description", default: "Formation de 2 jours intensifs pour apprendre le Marketing Digital. \n\nSEO - Acquisition Payante - Analyse de données."
    t.integer "price", default: 790
    t.string "location", default: "Paris"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.bigint "training_id", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["training_id"], name: "index_users_on_training_id"
  end

  add_foreign_key "users", "trainings"
end
