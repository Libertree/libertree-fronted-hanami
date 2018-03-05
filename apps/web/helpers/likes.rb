module Web
  module Helpers
    module Likes
      def comment_likes(comment:)
        count = comment.likes.count
        if count > 0
          raw %{<span>#{I18n.t('comment.num_likes', count: count)}</span>}
        end
      end

      def post_likes(post:)
        count = post.likes.count
        if count > 0
          raw %{<span>#{I18n.t('post.num_likes', count: count)}</span>}
        end
      end
    end
  end
end
