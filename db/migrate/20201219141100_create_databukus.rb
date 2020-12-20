class CreateDatabukus < ActiveRecord::Migration[6.0]
  def change
    create_table :databukus do |t|
      t.string :buku_judul
      t.string :buku_penulis
      t.string :buku_penerbit
      t.string :buku_thnterbit

      t.timestamps
    end
  end
end
