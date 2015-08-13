class AddActToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activity, :datetime
  end
end
