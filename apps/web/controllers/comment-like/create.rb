module Web::Controllers::CommentLike
  class Create
    include Web::Action

    def call(params)
      comment = Libertree::Model::Comment[params[:comment_id].to_i]

      if comment
        like = Libertree::Model::CommentLike.find_or_create(
          member_id: current_account.member.id,
          comment_id: comment.id,
        )

        if like
          flash[:success] = I18n.t('comment.liked')
        end

        redirect_to routes.path(:post, id: comment.post.id) + "#comment-#{comment.id}"
      else
        redirect_to routes.path(:home)
      end
    end
  end
end
