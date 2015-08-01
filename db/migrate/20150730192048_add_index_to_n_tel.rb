class AddIndexToNTel < ActiveRecord::Migration
  def change
    add_index :telefons, :n_tel, unique: true
  end
end
