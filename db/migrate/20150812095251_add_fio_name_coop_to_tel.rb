class AddFioNameCoopToTel < ActiveRecord::Migration
  def change
    add_column :telefons, :fio, :string
    add_column :telefons, :name, :string
    add_column :telefons, :coop, :string
  end
end
