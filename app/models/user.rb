require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  # validates :email, presence: true
  # validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password_hash, presence: true

  # getter
  def password
    @password ||= Password.new(password_hash)
  end

  # setter
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
