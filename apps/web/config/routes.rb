get '/home', to: 'home#index', as: :home

get '/comment/like/:comment_id', to: 'comment-like#create', as: :comment_like
get '/comment/unlike/:comment_id', to: 'comment-like#delete', as: :comment_unlike

get '/notification/:notification_id/mark-seen', to: 'notification#mark-seen', as: :notification_mark_seen
get '/notification/:notification_id/mark-unseen', to: 'notification#mark-unseen', as: :notification_mark_unseen

post '/post/:post_id/comment', to: 'comment#create', as: :comment_create
get '/post/latest-unread(/:earlier_than_post_id)', to: 'post#latest-unread', as: :post_latest_unread
get '/post/mark-unread/:post_id(/:go_home)', to: 'post#mark-unread', as: :post_mark_unread
get '/post/:id', to: 'post#show', as: :post

# TODO: Turn these into /post/like and /post/unlike
get '/post-like/:post_id', to: 'post-like#create', as: :post_like
get '/post-unlike/:post_id', to: 'post-like#delete', as: :post_unlike

get '/session/sign-in', to: 'session#sign_in', as: :sign_in
get '/session/sign-out', to: 'session#sign-out', as: :sign_out
post '/session', to: 'session#create'

redirect '/', to: '/home'
