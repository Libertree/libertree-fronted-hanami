module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        before :authenticate!
        expose :current_account
      end
    end

    private def authenticate!
      halt 401  if ! authenticated?
    end

    private def authenticated?
      current_account
    end

    private def current_account
      return @_current_account   if @_current_account

      session_account = SessionAccountRepository.new.find_by_session_id(session['session_id'])
      if session_account
        @_current_account = AccountRepository.new.find(session_account.account_id)
      end
    end
  end
end
