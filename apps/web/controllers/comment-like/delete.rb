module Web::Controllers::CommentLike
  class Delete
    include Web::Action

    def call(params)
      comment = Libertree::Model::Comment[params[:comment_id].to_i]

      if comment
        like = Libertree::Model::CommentLike[
          member_id: current_account.member.id,
          comment_id: comment.id,
        ]

        if like
          like.delete
          flash[:success] = I18n.t('comment.unliked')
        end

        redirect_to routes.path(:post, id: comment.post.id) + "#comment-#{comment.id}"
      else
        redirect_to routes.path(:home)
      end
    end
  end
end
