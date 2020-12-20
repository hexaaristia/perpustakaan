class AddDataBukuId < ActiveRecord::Migration[6.0]
  def change
      add_column :peminjamen, :databuku_id, :varchar
  end
end
