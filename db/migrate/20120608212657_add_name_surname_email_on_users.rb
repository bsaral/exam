class AddNameSurnameEmailOnUsers < ActiveRecord::Migration
  def up
	add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :email, :string
    
  end

  def down
  end
end
