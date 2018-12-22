require 'bcrypt'
class User < ApplicationRecord
  include BCrypt
  has_many :favorite_movies
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(pw)
    password == Password.create(pw)
  end

end