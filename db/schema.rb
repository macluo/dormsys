# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 9) do

  create_table "buildings_apts", primary_key: "unit_no", force: true do |t|
    t.string  "manager_fname",    limit: 20
    t.string  "manager_lname",    limit: 20
    t.string  "phone_no",         limit: 10
    t.integer "category"
    t.boolean "upper_class_only"
  end

  create_table "family_apts", primary_key: "apt_no", force: true do |t|
    t.integer "no_bedrm"
    t.integer "no_bath"
    t.float   "rent",     limit: 24
    t.string  "occupant", limit: 10
  end

  add_index "family_apts", ["occupant"], name: "occupant", using: :btree

  create_table "family_members", id: false, force: true do |t|
    t.string "sid",   limit: 10,              null: false
    t.string "fname", limit: 20, default: "", null: false
    t.string "lname", limit: 20, default: "", null: false
    t.string "mname", limit: 20
    t.date   "DOB"
  end

  create_table "housing_requests", primary_key: "req_no", force: true do |t|
    t.string  "sid",             limit: 10, null: false
    t.integer "app_status"
    t.boolean "parking"
    t.integer "park_class"
    t.boolean "pref_nearby"
    t.string  "building_pref_1", limit: 10
    t.string  "building_pref_2", limit: 10
    t.string  "building_pref_3", limit: 10
    t.string  "apt_pref_1",      limit: 10
    t.string  "apt_pref_2",      limit: 10
    t.string  "apt_pref_3",      limit: 10
    t.integer "period"
    t.integer "pay_option"
    t.date    "movein_date"
  end

  add_index "housing_requests", ["apt_pref_1"], name: "apt_pref_1", using: :btree
  add_index "housing_requests", ["apt_pref_2"], name: "apt_pref_2", using: :btree
  add_index "housing_requests", ["apt_pref_3"], name: "apt_pref_3", using: :btree
  add_index "housing_requests", ["building_pref_1"], name: "building_pref_1", using: :btree
  add_index "housing_requests", ["building_pref_2"], name: "building_pref_2", using: :btree
  add_index "housing_requests", ["building_pref_3"], name: "building_pref_3", using: :btree
  add_index "housing_requests", ["park_class"], name: "park_class", using: :btree
  add_index "housing_requests", ["sid"], name: "sid", using: :btree

  create_table "invoices", primary_key: "inv_no", force: true do |t|
    t.date    "duedate"
    t.float   "payment_due",     limit: 24
    t.string  "sid",             limit: 10
    t.integer "lease_no",                   null: false
    t.date    "paid_date"
    t.string  "pay_method",      limit: 10
    t.boolean "paid"
    t.date    "bill_start_date"
    t.date    "bill_end_date"
  end

  add_index "invoices", ["lease_no"], name: "lease_no", using: :btree
  add_index "invoices", ["sid"], name: "sid", using: :btree

  create_table "maintenance_requests", primary_key: "ticket_no", force: true do |t|
    t.string "severity",     limit: 10
    t.date   "created_date"
    t.string "apt_no",       limit: 10
    t.string "place_no",     limit: 20
    t.string "unit_no",      limit: 20
    t.string "comments",     limit: 50
    t.string "sid",          limit: 10, null: false
  end

  add_index "maintenance_requests", ["apt_no"], name: "apt_no", using: :btree
  add_index "maintenance_requests", ["place_no"], name: "place_no", using: :btree
  add_index "maintenance_requests", ["sid"], name: "sid", using: :btree
  add_index "maintenance_requests", ["unit_no"], name: "unit_no", using: :btree

  create_table "parking_class", primary_key: "class_id", force: true do |t|
    t.string "class", limit: 10
    t.float  "fee",   limit: 24
  end

  create_table "parking_lots", primary_key: "lot_no", force: true do |t|
    t.string "nearby_housing", limit: 60
  end

  create_table "parking_requests", primary_key: "req_no", force: true do |t|
    t.string  "sid",          limit: 10, null: false
    t.integer "app_status"
    t.integer "vehicle_type"
    t.boolean "pref_nearby"
    t.boolean "is_disabled"
  end

  add_index "parking_requests", ["sid"], name: "sid", using: :btree

  create_table "parking_spots", primary_key: "spot_no", force: true do |t|
    t.integer "class_id"
    t.integer "lot_no",              null: false
    t.string  "occupant", limit: 10
  end

  add_index "parking_spots", ["class_id"], name: "class_id", using: :btree
  add_index "parking_spots", ["lot_no"], name: "lot_no", using: :btree
  add_index "parking_spots", ["occupant"], name: "occupant", using: :btree

  create_table "persons", primary_key: "pid", force: true do |t|
    t.string "password",    limit: 20, null: false
    t.string "p_type",      limit: 10
    t.string "fname",       limit: 20, null: false
    t.string "mname",       limit: 20
    t.string "lname",       limit: 20, null: false
    t.string "nationality", limit: 10
    t.string "street",      limit: 50
    t.string "city",        limit: 50
    t.string "state",       limit: 50
    t.string "country",     limit: 50
    t.date   "DOB"
    t.string "phone",       limit: 15
    t.string "alt_phone",   limit: 15
    t.string "gender",      limit: 1
  end

  create_table "proc_housing", id: false, force: true do |t|
    t.string  "staff_id",         limit: 10,  default: "", null: false
    t.integer "req_no",                       default: 0,  null: false
    t.date    "process_date"
    t.string  "process_comments", limit: 100
  end

  add_index "proc_housing", ["req_no"], name: "req_no", using: :btree

  create_table "proc_maintenance", id: false, force: true do |t|
    t.string  "staff_id",         limit: 10,  default: "", null: false
    t.integer "ticket_no",                    default: 0,  null: false
    t.date    "process_date"
    t.string  "process_comments", limit: 100
  end

  add_index "proc_maintenance", ["ticket_no"], name: "ticket_no", using: :btree

  create_table "proc_termination", id: false, force: true do |t|
    t.string  "staff_id",         limit: 10,  default: "", null: false
    t.integer "t_req_no",                     default: 0,  null: false
    t.date    "process_date"
    t.string  "process_comments", limit: 100
  end

  add_index "proc_termination", ["t_req_no"], name: "t_req_no", using: :btree

  create_table "rooms", id: false, force: true do |t|
    t.string  "unit_no",  limit: 20,              null: false
    t.string  "place_no", limit: 10, default: "", null: false
    t.integer "room_no"
    t.float   "rent",     limit: 24
    t.string  "occupant", limit: 10
  end

  add_index "rooms", ["occupant"], name: "occupant", using: :btree
  add_index "rooms", ["unit_no"], name: "unit_no", using: :btree

  create_table "semesters", primary_key: "no", force: true do |t|
    t.integer "year"
    t.string  "term", limit: 10
  end

  create_table "signed_leases", primary_key: "lease_no", force: true do |t|
    t.string  "sid",          limit: 10, null: false
    t.string  "place_no",     limit: 10
    t.string  "apt_no",       limit: 10
    t.float   "rent",         limit: 24
    t.float   "parking_fee",  limit: 24
    t.integer "start_sem"
    t.integer "end_sem"
    t.float   "deposit",      limit: 24
    t.integer "pay_option"
    t.string  "parking_spot", limit: 10
    t.integer "permit_id"
    t.string  "unit_no",      limit: 20
  end

  add_index "signed_leases", ["apt_no"], name: "apt_no", using: :btree
  add_index "signed_leases", ["parking_spot"], name: "parking_spot", using: :btree
  add_index "signed_leases", ["permit_id"], name: "permit_id", unique: true, using: :btree
  add_index "signed_leases", ["place_no"], name: "place_no", using: :btree
  add_index "signed_leases", ["sid", "start_sem", "end_sem"], name: "chk_duplicate", unique: true, using: :btree
  add_index "signed_leases", ["unit_no"], name: "unit_no", using: :btree

  create_table "staffs", primary_key: "staff_id", force: true do |t|
    t.string "works_in_building", limit: 20
    t.string "works_in_apt",      limit: 10
    t.string "job_title",         limit: 10
  end

  add_index "staffs", ["works_in_apt"], name: "works_in_apt", using: :btree
  add_index "staffs", ["works_in_building"], name: "works_in_building", using: :btree

  create_table "students", primary_key: "sid", force: true do |t|
    t.string  "s_type",          limit: 5
    t.string  "add_comment",     limit: 100
    t.integer "s_status"
    t.boolean "smoke"
    t.string  "spec_sneeds",     limit: 50
    t.string  "category",        limit: 20
    t.string  "kin_street",      limit: 50
    t.string  "kin_city",        limit: 50
    t.string  "kin_country",     limit: 50
    t.string  "kin_fname",       limit: 20,  null: false
    t.string  "kin_lname",       limit: 20,  null: false
    t.string  "kin_phone",       limit: 10,  null: false
    t.string  "kin_middle_name", limit: 20
  end

  create_table "termination_requests", primary_key: "t_req_no", force: true do |t|
    t.integer "lease_no",                    null: false
    t.date    "insp_date"
    t.integer "app_status"
    t.string  "reason",           limit: 50
    t.date    "termination_date"
  end

  add_index "termination_requests", ["lease_no"], name: "lease_no", using: :btree

end
