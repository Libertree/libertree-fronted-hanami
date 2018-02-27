get '/home', to: 'home#index', as: :home

get '/post/latest-unread', to: 'post#latest-unread', as: :post_latest_unread
get '/post/:id', to: 'post#show', as: :post

get '/post-like/:post_id', to: 'post-like#create', as: :post_like

get '/session/sign-in', to: 'session#sign_in', as: :sign_in
get '/session/sign-out', to: 'session#sign-out', as: :sign_out
post '/session', to: 'session#create'
