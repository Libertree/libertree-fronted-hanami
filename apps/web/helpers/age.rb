# This code was copied from libertree-frontend-ramaze

require 'date'

module Web
  module Helpers
    module Age
      def ago(datetime)
        total_seconds = DateTime.now.to_time.to_i - datetime.to_time.to_i
        total_minutes = total_seconds / 60
        total_hours = total_minutes / 60

        display_seconds = total_seconds % 60
        display_minutes = total_minutes % 60
        display_hours = total_hours % 60
        display_days = total_hours / 24

        if display_days > 0
          I18n.translate('ago.num_days', count: display_days)
        elsif display_hours > 0
          I18n.translate('ago.num_hours', count: display_hours)
        elsif display_minutes > 0
          I18n.translate('ago.num_minutes', count: display_minutes)
        else
          I18n.t('ago.seconds')
        end
      end
    end
  end
end
