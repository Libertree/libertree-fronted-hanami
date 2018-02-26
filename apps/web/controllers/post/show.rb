module Web::Controllers::Post
  class Show
    include Web::Action

    expose :post

    def call(params)
      @post = Libertree::Model::Post[params[:id].to_i]

      if @post.nil?
        halt 404
      else
        @post.mark_as_read_by(current_account)
        Libertree::Model::Notification.mark_seen_for_account_and_post(current_account, @post)
      end
    end
  end
end
