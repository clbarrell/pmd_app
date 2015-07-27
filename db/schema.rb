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

ActiveRecord::Schema.define(version: 20150727095206) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organisation_id"
  end

  add_index "clients", ["name"], name: "index_clients_on_name"
  add_index "clients", ["organisation_id"], name: "index_clients_on_organisation_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["client_id"], name: "index_contacts_on_client_id"
  add_index "contacts", ["name"], name: "index_contacts_on_name"

  create_table "project_splits", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "type"
    t.decimal  "percentage", precision: 4, scale: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "project_splits", ["project_id"], name: "index_project_splits_on_project_id"
  add_index "project_splits", ["user_id"], name: "index_project_splits_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "job_number"
    t.decimal  "total",              precision: 9, scale: 2
    t.integer  "probability"
    t.string   "service_line"
    t.string   "status"
    t.string   "type"
    t.boolean  "suitable_reference"
    t.integer  "client_id"
    t.integer  "contact_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "projects", ["client_id"], name: "index_projects_on_client_id"
  add_index "projects", ["contact_id"], name: "index_projects_on_contact_id"
  add_index "projects", ["job_number"], name: "index_projects_on_job_number"
  add_index "projects", ["name"], name: "index_projects_on_name"
  add_index "projects", ["status"], name: "index_projects_on_status"
  add_index "projects", ["suitable_reference"], name: "index_projects_on_suitable_reference"
  add_index "projects", ["type"], name: "index_projects_on_type"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "initials"
    t.boolean  "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["initials"], name: "index_users_on_initials"
  add_index "users", ["name"], name: "index_users_on_name"

end
