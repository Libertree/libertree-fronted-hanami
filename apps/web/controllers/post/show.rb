module Web::Controllers::Post
  class Show
    include Web::Action

    expose :post

    def call(params)
      @post = Libertree::Model::Post[params[:id].to_i]

      halt 404  if @post.nil?
    end
  end
end
