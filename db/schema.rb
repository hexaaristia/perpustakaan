# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_19_173133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anggota", force: :cascade do |t|
    t.string "anggota_nama"
    t.string "anggota_tgllahir"
    t.string "anggota_alamat"
    t.string "anggota_jk"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "databukus", force: :cascade do |t|
    t.string "buku_judul"
    t.string "buku_penulis"
    t.string "buku_penerbit"
    t.string "buku_thnterbit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "oadms", force: :cascade do |t|
    t.string "oadm_nama"
    t.string "oadm_email"
    t.string "oadm_telepon"
    t.string "oadm_password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "oadm_status"
  end

  create_table "peminjamen", force: :cascade do |t|
    t.string "peminjaman_nama"
    t.string "peminjaman_buku"
    t.string "peminjaman_tglpinjam"
    t.string "peminjaman_tglkembali"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "anggota_id"
    t.string "peminjaman_status"
    t.string "databuku_id"
  end

  create_table "pengembalians", force: :cascade do |t|
    t.string "pengembalian_idpinjam"
    t.string "pengembalian_tanggal"
    t.string "pengembalian_denda"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
