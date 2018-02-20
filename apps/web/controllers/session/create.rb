module Web::Controllers::Session
  class Create
    include Web::Action

    def call(params)
      account = AccountRepository.new.find_by_creds(
        creds: params.raw.slice('username', 'password')
      )
      if account
        SessionAccountRepository.new.ensure_exists(
          sid: session.id,
          account_id: account.id,
        )
        redirect_to routes.home_path
      else
        redirect_to routes.sign_in_path
      end
    end

    private def authenticate!
      # skip authentication
    end
  end
end
