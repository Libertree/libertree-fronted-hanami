require 'bcrypt'

class AccountRepository < Hanami::Repository
  def find_by_creds(creds:)
    account = accounts.where(username: creds['username']).first
    if account&.password == creds['password']
      account
    end
  end
end
