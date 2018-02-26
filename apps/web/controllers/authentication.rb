module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        before :authenticate!
        expose :current_account
      end
    end

    private def authenticate!
      if ! authenticated?
        flash[:error] = "Please sign in."
        redirect_to routes.path(:sign_in)
      end
    end

    private def authenticated?
      current_account
    end

    private def current_session
      Libertree::Model::SessionAccount[
        sid: session['session_id']
      ]
    end

    private def sign_out_current_account
      current_session&.delete
      flash[:success] = "Signed out."
      redirect_to routes.path(:sign_in)
    end

    private def current_account
      @_current_account ||= current_session&.account
    end
  end
end
