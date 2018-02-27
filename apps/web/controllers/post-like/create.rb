module Web::Controllers::PostLike
  class Create
    include Web::Action

    def call(params)
      post = Libertree::Model::Post[params[:post_id].to_i]

      if post
        Libertree::Model::PostLike.find_or_create(
          member_id: current_account.member.id,
          post_id:   post.id,
        )

        redirect_to routes.path(:post, id: post.id)
      else
        redirect_to routes.path(:home)
      end
    end
  end
end
