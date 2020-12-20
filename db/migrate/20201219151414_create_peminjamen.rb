class CreatePeminjamen < ActiveRecord::Migration[6.0]
  def change
    create_table :peminjamen do |t|
      t.string :peminjaman_nama
      t.string :peminjaman_buku
      t.string :peminjaman_tglpinjam
      t.string :peminjaman_tglkembali

      t.timestamps
    end
  end
end
