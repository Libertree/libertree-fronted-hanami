module Web::Controllers::Notification
  class MarkUnseen
    include Web::Action

    def call(params)
      ids = params[:notification_ids].to_s.split(',').map(&:to_i)

      Libertree::Model::Notification.mark_unseen_for_account(
        current_account,
        ids
      )

      redirect_to request.get_header('Referer') || routes.path(:home)
    end
  end
end
