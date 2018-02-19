require 'bcrypt'

class Account < Hanami::Entity
  # These two password methods provide a seamless interface to the BCrypted
  # password.  The pseudo-field "password" can be treated like a normal
  # String field for reading and writing.
  def password
    BCrypt::Password.new(password_encrypted)
  end

  def password=( new_password )
    _password = BCrypt::Password.create(new_password)
    self.password_encrypted = _password
  end
end
