class Role < ActiveRecord::Base
  has_many :users_roles
  has_many :users, through: :users_roles

  enum role: { user: 'user', admin: 'admin', sysadmin: 'sysadmin' }
end
