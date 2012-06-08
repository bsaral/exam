class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => "guest"
  end
end
