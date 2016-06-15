class User < ApplicationRecord
  has_secure_password

  ROLES = ['admin', 'editor']
end