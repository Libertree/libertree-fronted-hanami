module Web::Controllers::Notification
  class MarkUnseen
    include Web::Action

    def call(params)
      Libertree::Model::Notification.mark_unseen_for_account(
        current_account,
        params[:notification_id].to_i
      )

      redirect_to request.get_header('Referer') || routes.path(:home)
    end
  end
end
