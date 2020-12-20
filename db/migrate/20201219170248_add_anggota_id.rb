class AddAnggotaId < ActiveRecord::Migration[6.0]
  def change
    add_column :peminjamen, :anggota_id, :varchar
  end
end
