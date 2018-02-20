module Web::Controllers::Session
  class SignIn
    include Web::Action

    def call(params)
    end

    private def authenticate!
      # skip authentication
    end
  end
end
