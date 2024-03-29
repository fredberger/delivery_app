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

ActiveRecord::Schema.define(version: 2018_06_20_194650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "pdvs", force: :cascade do |t|
    t.string "tradingName"
    t.string "ownerName"
    t.string "document"
    t.json "coverageArea", default: {}, null: false
    t.json "address", default: {}, null: false
    t.geometry "delivery_area", limit: {:srid=>0, :type=>"geometry"}
    t.geography "lnglat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
  end

end
