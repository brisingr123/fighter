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

ActiveRecord::Schema.define(version: 2019_02_05_093714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_companies", id: false, force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "category_id", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "subcountry"
    t.string "geonameid"
  end

  create_table "cofounders", force: :cascade do |t|
    t.string "name"
    t.string "linkedin"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_cofounders_on_company_id"
  end

  create_table "cofounders_companies", id: false, force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "cofounder_id", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "founded_in"
    t.string "website"
    t.string "last_funding"
    t.bigint "total_funding"
    t.integer "team_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
  end

  create_table "companies_investors", id: false, force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "investor_id", null: false
  end

  create_table "companies_products", id: false, force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "product_id", null: false
  end

  create_table "investor_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_investor_tags_on_name"
  end

  create_table "investor_tags_investors", id: false, force: :cascade do |t|
    t.bigint "investor_id", null: false
    t.bigint "investor_tag_id", null: false
  end

  create_table "investors", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "phone"
    t.string "location"
    t.integer "city_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
