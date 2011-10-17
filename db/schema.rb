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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111017154244) do

  create_table "alumnos", :force => true do |t|
    t.string   "name"
    t.string   "apellido"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "asignaturas", :force => true do |t|
    t.string   "subject"
    t.string   "profesor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "office"
    t.string   "telephone"
    t.string   "email"
  end

  create_table "calificaciones", :force => true do |t|
    t.decimal  "nota",          :precision => 4, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "alumno_id"
    t.integer  "asignatura_id"
    t.string   "comentarios"
  end

  create_table "presencias", :force => true do |t|
    t.string   "presentado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "surname"
    t.string   "tipo"
  end

end
