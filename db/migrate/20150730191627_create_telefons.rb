class CreateTelefons < ActiveRecord::Migration
  def change
    create_table :telefons do |t|
      t.string :n_tel

      t.timestamps null: false
    end
  end
end
