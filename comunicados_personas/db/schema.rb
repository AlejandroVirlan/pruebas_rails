# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_04_193831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adjuntos", force: :cascade do |t|
    t.bigint "comunicado_id", null: false
    t.index ["comunicado_id"], name: "index_adjuntos_on_comunicado_id"
  end

  create_table "comunicados", force: :cascade do |t|
    t.bigint "creador_id", null: false
    t.bigint "receptor_id", null: false
    t.string "asunto"
    t.text "contenido"
    t.bigint "comunicado_anterior_id"
    t.index ["comunicado_anterior_id"], name: "index_comunicados_on_comunicado_anterior_id"
    t.index ["creador_id"], name: "index_comunicados_on_creador_id"
    t.index ["receptor_id"], name: "index_comunicados_on_receptor_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre"
    t.date "fecha_nacimiento"
  end

  add_foreign_key "adjuntos", "comunicados"
  add_foreign_key "comunicados", "comunicados", column: "comunicado_anterior_id"
  add_foreign_key "comunicados", "personas", column: "creador_id"
  add_foreign_key "comunicados", "personas", column: "receptor_id"
end
