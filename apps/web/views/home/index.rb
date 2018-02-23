module Web::Views::Home
  class Index
    include Web::View

    def num_unread
      current_account.home_river.num_unread
    end
  end
end
