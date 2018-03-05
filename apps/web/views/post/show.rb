module Web::Views::Post
  class Show
    include Web::View

    def comment_count
      I18n.t('post.num_comments', count: post.comments.count)
    end
  end
end
