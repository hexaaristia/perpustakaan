class AddStatusPengembalian < ActiveRecord::Migration[6.0]
  def change
    add_column :peminjamen, :peminjaman_status, :varchar
  end
end
