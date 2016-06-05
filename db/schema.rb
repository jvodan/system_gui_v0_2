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

ActiveRecord::Schema.define(version: 20160526060457) do

  create_table "apps", force: :cascade do |t|
    t.integer  "system_id"
    t.string   "name"
    t.string   "label"
    t.string   "title"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.string   "icon_updated_at"
    t.string   "installer_icon_url"
    t.boolean  "worker"
    t.boolean  "portal_show"
    t.string   "portal_link"
    t.text     "portal_worker_message"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "fields", force: :cascade do |t|
    t.integer "field_consumer_id"
    t.string  "field_consumer_type"
    t.string  "method_name"
    t.string  "value"
    t.string  "label"
    t.string  "as"
    t.string  "title"
    t.boolean "horizontal"
    t.boolean "compact"
    t.integer "left"
    t.integer "width"
    t.integer "right"
    t.string  "collection"
    t.string  "tooltip"
    t.string  "hint"
    t.string  "placeholder"
    t.string  "comment"
    t.string  "validate_regex"
    t.string  "validate_invalid_message"
    t.string  "depends_on_field"
    t.string  "depends_on_regex"
    t.string  "depends_on_value"
    t.string  "depends_on_property"
    t.string  "depends_on_display"
    t.boolean "required"
    t.boolean "read_only"
  end

  create_table "installer_new_app_environment_variables", force: :cascade do |t|
    t.integer "new_app_id"
    t.boolean "ask_at_build_time"
    t.boolean "build_time_only"
  end

  create_table "installer_new_app_service_connections", force: :cascade do |t|
    t.integer "new_app_id"
    t.string  "publisher_namespace"
    t.string  "type_path"
    t.string  "create_type"
    t.string  "existing_service"
    t.string  "orphan_service"
  end

  create_table "installer_new_apps", force: :cascade do |t|
    t.integer "repository_id"
    t.string  "label"
    t.string  "container_name"
    t.string  "host_name"
    t.string  "domain_name"
    t.string  "http_protocol"
    t.integer "memory"
    t.boolean "license_accept"
  end

  create_table "installer_repositories", force: :cascade do |t|
    t.text   "blueprint"
    t.text   "raw_blueprint"
    t.string "app_label"
    t.string "app_icon_url"
    t.string "repository_url"
    t.string "library_id"
  end

  create_table "system_activity_snapshots", force: :cascade do |t|
    t.text "engines_memory"
    t.text "services_memory"
    t.text "containers_memory"
    t.text "system_memory"
    t.text "cpu_load"
    t.text "cpu_queue"
    t.text "disks"
    t.text "network"
  end

  create_table "system_libraries", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "systems", force: :cascade do |t|
    t.string   "label"
    t.string   "default_domain"
    t.string   "admin_banner"
    t.string   "text_color"
    t.string   "background_color"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.text     "portal_header"
    t.text     "portal_footer"
    t.boolean  "portal_center_align"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "suspended_at"
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
