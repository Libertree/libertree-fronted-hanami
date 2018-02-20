module Web::Controllers::Home
  class Index
    include Web::Action

    expose :current_account

    def call(params)
    end
  end
end
