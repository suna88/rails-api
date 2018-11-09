class User < ApplicationRecord
  has_many :menus
  has_secure_token
end
