module Web::Controllers::Session
  class SignIn
    include Web::Action

    def call(params)
    end

    private def authenticate!
      if authenticated?
        redirect_to routes.path(:home)
      end
    end
  end
end
