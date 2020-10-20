class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, length: { in: 8..20 }
  validates :password_confirmation, length: { in: 8..20 }

	def self.authenticate_with_credentials(email, password)
		@user = self.where("lower(email) = ?", email.delete(' ').downcase).first.try(:authenticate, password) 
	end
end
