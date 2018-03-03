module Web
  module Helpers
    module Link
      def link_to_comment(comment, link_text: 'comment')
        comment_anchor = "#comment-#{comment.id}"
        link_to link_text, routes.path(:post, id: comment.post.id) + comment_anchor
      end

      def link_to_post(post, link_text: 'post')
        link_to link_text, routes.path(:post, id: post.id)
      end
    end
  end
end
