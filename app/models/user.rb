class User < ApplicationRecord
  has_secure_password

  ROLES = ['admin', 'editor']

  validates :email, :role, :name, presence: true
  validates :role, inclusion: {in: ROLES}

  def is?(a_role)
    role.to_sym == a_role.to_sym
  end
end