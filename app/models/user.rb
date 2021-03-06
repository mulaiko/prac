class User < ApplicationRecord
	acts_as_followable
	acts_as_follower
  validates :name, presence: true
	has_many :posts
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end