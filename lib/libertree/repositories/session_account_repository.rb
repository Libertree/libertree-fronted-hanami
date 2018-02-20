class SessionAccountRepository < Hanami::Repository
  self.relation = :sessions_accounts

  def ensure_exists(*args)
    existing = sessions_accounts.where(*args).first
    if existing.nil?
      create(*args)
    end
  end

  def find_by_session_id(session_id)
    sessions_accounts.where(sid: session_id).first
  end
end
