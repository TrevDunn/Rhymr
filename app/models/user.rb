class User < ActiveRecord::Base
	has_many :comments

	has_secure_password
	validates :email, presence: true
	validates :password, length: { in: 6..20 }
	validates :password, presence: true
end
