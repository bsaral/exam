class User < ActiveRecord::Base

  attr_accessible :username, :password, :password_confirmation, :role

 
  ROLES = %w[student author]

  def role?(base_role)
       ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
  
  has_secure_password
  
end
