module Web::Controllers::Comment
  class Create
    include Web::Action

    def call(params)
      post = Libertree::Model::Post[params[:post_id].to_i]

      if post
        comment = Libertree::Model::Comment.create(
          member_id: current_account.member.id,
          post_id:   post.id,
          text: params[:text].to_s,
        )

        if comment
          flash[:success] = I18n.t('post.comment_added')
        end

        redirect_to routes.path(:post, id: post.id) + "#comment-#{comment.id}"
      else
        redirect_to routes.path(:home)
      end
    end
  end
end
