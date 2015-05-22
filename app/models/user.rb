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

  #setter
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  has_many :keits

  has_many :references_to_followings, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followings, through: :references_to_followings

  has_many :references_to_followers, class_name: "Relationship", foreign_key: "following_id"
  has_many :followers, through: :references_to_followers

end
