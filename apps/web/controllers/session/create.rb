module Web::Controllers::Session
  class Create
    include Web::Action

    def call(params)
      account = Libertree::Model::Account.authenticate(
        params.raw.slice('username', 'password')
      )

      if account
        Libertree::Model::SessionAccount.find_or_create(
          sid: session.id,
          account_id: account.id
        )
        redirect_to routes.path(:home)
      else
        redirect_to routes.path(:sign_in)
      end
    end

    private def authenticate!
      # skip authentication
    end
  end
end
