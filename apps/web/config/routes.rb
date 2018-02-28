get '/home', to: 'home#index', as: :home

post '/post/:post_id/comment', to: 'comment#create', as: :comment_create
get '/post/latest-unread', to: 'post#latest-unread', as: :post_latest_unread
get '/post/mark-unread/:post_id', to: 'post#mark-unread', as: :post_mark_unread
get '/post/:id', to: 'post#show', as: :post

get '/post-like/:post_id', to: 'post-like#create', as: :post_like
get '/post-unlike/:post_id', to: 'post-like#delete', as: :post_unlike

get '/session/sign-in', to: 'session#sign_in', as: :sign_in
get '/session/sign-out', to: 'session#sign-out', as: :sign_out
post '/session', to: 'session#create'
