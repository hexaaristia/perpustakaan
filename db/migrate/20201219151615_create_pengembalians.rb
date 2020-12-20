class CreatePengembalians < ActiveRecord::Migration[6.0]
  def change
    create_table :pengembalians do |t|
      t.string :pengembalian_idpinjam
      t.string :pengembalian_tanggal
      t.string :pengembalian_denda

      t.timestamps
    end
  end
end
