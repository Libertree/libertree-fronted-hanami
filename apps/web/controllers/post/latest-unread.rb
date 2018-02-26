module Web::Controllers::Post
  class LatestUnread
    include Web::Action

    def call(params)
      post = current_account.home_river.latest_unread
      redirect_to routes.path(:post, id: post.id)
    end
  end
end
