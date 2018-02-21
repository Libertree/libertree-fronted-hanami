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
      @_current_account ||= Libertree::Model::SessionAccount[
        sid: session['session_id']
      ]&.account
    end
  end
end
