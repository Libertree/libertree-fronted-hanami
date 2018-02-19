class SessionAccountRepository < Hanami::Repository
  self.relation = :sessions_accounts

  def ensure_exists(*args)
    existing = sessions_accounts.where(*args)
    if existing.nil?
      sessions_accounts.changeset(:create, *args).commit
    end
  end
end
