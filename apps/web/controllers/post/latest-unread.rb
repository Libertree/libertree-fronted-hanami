module Web::Controllers::Post
  class LatestUnread
    include Web::Action

    def call(params)
      earlier_post = Libertree::Model::Post[ params[:earlier_than_post_id].to_i ]
      post = current_account.home_river.latest_unread(earlier_than_post: earlier_post)
      redirect_to routes.path(:post, id: post.id)
    end
  end
end
