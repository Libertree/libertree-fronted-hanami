module Web::Controllers::Home
  class Index
    include Web::Action

    expose :current_account, :posts

    def call(params)
      @posts = current_account.home_river.posts
    end
  end
end
