module Web::Controllers::Session
  class SignOut
    include Web::Action

    def call(params)
      sign_out_current_account
    end

    private def authenticate!
      # skip authentication
    end
  end
end
