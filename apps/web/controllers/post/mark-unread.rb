module Web::Controllers::Post
  class MarkUnread
    include Web::Action

    def call(params)
      post = (
        Libertree::Model::Post[ params[:post_id].to_i ]  ||
        Libertree::Model::NilPost.new
      )
      next_post = current_account.home_river.latest_unread(earlier_than_post: post)

      post.mark_as_unread_by current_account

      redirect_to routes.path(:post, id: next_post.id)
    end
  end
end
