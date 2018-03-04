module Web::Controllers::Post
  class Show
    include Web::Action

    expose :post

    def call(params)
      @post = Libertree::Model::Post[params[:id].to_i]

      if @post.nil?
        flash[:error] = I18n.t('post.could_not_display')
        redirect_to routes.path(:home)
      else
        @post.mark_as_read_by(current_account)
        Libertree::Model::Notification.mark_seen_for_account_and_post(current_account, @post)
        Libertree::Model::Notification.mark_seen_for_account_and_comment_id(current_account, @post.comments.map(&:id))
      end
    end
  end
end
