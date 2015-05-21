class User < ActiveRecord::Base

  has_secure_password

  has_many :keits

  has_many :references_to_followings, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followings, through: :references_to_followings
  has_many :references_to_followers, class_name: "Relationship", foreign_key: "following_id"
  has_many :followers, through: :references_to_followers

end
