module Web::Views::Home
  class Index
    include Web::View

    def num_unread
      current_account.home_river.num_unread
    end

    def num_notifications_unseen
      current_account.num_notifications_unseen
    end

    def notifications_unseen_grouped
      current_account.notifications_unseen_grouped(max_groups: 30).map { |g|
        Libertree::NotificationGroup.new(g)
      }
    end
  end
end
