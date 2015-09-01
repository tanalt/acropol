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

ActiveRecord::Schema.define(version: 20150824085914) do

  create_table "ips", force: :cascade do |t|
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.string   "kod_rajonu"
    t.integer  "kilk_kimn"
    t.string   "planuvannya"
    t.string   "rozd_proh"
    t.string   "poverh"
    t.float    "vart_na_r"
    t.float    "vart_start"
    t.float    "komis"
    t.string   "vulycia"
    t.string   "bud"
    t.string   "plosha"
    t.string   "vikna"
    t.string   "opalennya"
    t.string   "stan_kv"
    t.string   "santeh"
    t.string   "pidloga"
    t.string   "vilna"
    t.string   "orenda"
    t.string   "foto"
    t.string   "vlasnyk"
    t.string   "exlusiv"
    t.string   "n_tel_vlasn"
    t.string   "rezult_prozv"
    t.integer  "user_excl"
    t.string   "kontrol"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "telefons", force: :cascade do |t|
    t.string   "n_tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "fio"
    t.string   "name"
    t.string   "coop"
    t.string   "color"
  end

  add_index "telefons", ["n_tel"], name: "index_telefons_on_n_tel", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.integer  "privilege"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_token"
    t.string   "fio"
    t.datetime "activity"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
