class User < ApplicationRecord
	include BCrypt
	has_one :school
	

	def password
    @password ||= Password.new(password_digest) unless password_digest.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
