class AddOadmStatus < ActiveRecord::Migration[6.0]
  def change
    add_column :oadms, :oadm_status, :varchar
  end
end
