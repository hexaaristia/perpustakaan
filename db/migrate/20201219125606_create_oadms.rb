class CreateOadms < ActiveRecord::Migration[6.0]
  def change
    create_table :oadms do |t|
      t.string :oadm_nama
      t.string :oadm_email
      t.string :oadm_telepon
      t.string :oadm_password

      t.timestamps
    end
  end
end
