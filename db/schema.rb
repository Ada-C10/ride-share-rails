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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2018_10_02_170928) do
=======
ActiveRecord::Schema.define(version: 2018_10_02_170927) do
>>>>>>> c01c51bfdd9ac618d83c7dce367c423477c55977

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "vin"
=======
  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "phone_num"
>>>>>>> c01c51bfdd9ac618d83c7dce367c423477c55977
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
