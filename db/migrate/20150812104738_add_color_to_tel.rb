class AddColorToTel < ActiveRecord::Migration
  def change
    add_column :telefons, :color, :string
  end
end
