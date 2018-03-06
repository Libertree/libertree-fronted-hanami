module Libertree
  class NotificationGroup
    def initialize(notifications)
      @notifications = notifications
    end

    def type
      @notifications[0].type
    end

    def context
      @notifications[0].context
    end

    def actors
      @notifications.map(&:actor).uniq.map(&:name_display)
    end

    def actor_list
      Libertree::AndedList.new(actors).to_s
    end

    def subject
      @notifications.min { |n| n.subject.id }.subject
    end

    def time_created
      @notifications[0].time_created
    end

    def notification_ids
      @notifications.map(&:id)
    end
  end
end
