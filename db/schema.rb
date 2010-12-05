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

ActiveRecord::Schema.define(:version => 20101205195526) do

  create_table "items", :force => true do |t|
    t.string "name"
    t.string "initial_room"
  end

  create_table "pathways", :force => true do |t|
    t.string  "from"
    t.string  "direction"
    t.string  "going_to"
    t.string  "type"
    t.string  "restriction"
    t.string  "item"
    t.string  "result"
    t.boolean "fatal_without_item", :default => false
  end

  create_table "rooms", :force => true do |t|
    t.string "key"
    t.text   "description"
  end

end
