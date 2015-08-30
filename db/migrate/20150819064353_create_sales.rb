class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :kod_rajonu
      t.integer :kilk_kimn
      t.string :planuvannya
      t.string :rozd_proh
      t.string :poverh
      t.float :vart_na_r
      t.float :vart_start
      t.float :komis
      t.string :vulycia
      t.string :bud
      t.string :plosha
      t.string :vikna
      t.string :opalennya
      t.string :stan_kv
      t.string :santeh
      t.string :pidloga
      t.string :vilna
      t.string :orenda
      t.string :foto
      t.string :vlasnyk
      t.string :exlusiv
      t.integer :user_excl


      t.timestamps null: false
    end
  end
end
