class AddJoinDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :join_date, :integer
  end
end
