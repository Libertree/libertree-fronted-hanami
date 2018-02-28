module Web::Controllers::Post
  class MarkUnread
    include Web::Action

    def call(params)
      post = (
        Libertree::Model::Post[ params[:post_id].to_i ]  ||
        Libertree::Model::NilPost.new
      )

      post.mark_as_unread_by current_account

      redirect_to routes.path(:home)
    end
  end
end
