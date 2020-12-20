class CreateAnggota < ActiveRecord::Migration[6.0]
  def change
    create_table :anggota do |t|
      t.string :anggota_nama
      t.string :anggota_tgllahir
      t.string :anggota_alamat
      t.string :anggota_jk

      t.timestamps
    end
  end
end
