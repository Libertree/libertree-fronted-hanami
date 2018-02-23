# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/

get '/home', to: 'home#index', as: :home
get '/post/:id', to: 'post#show', as: :post
get '/session/sign-in', to: 'session#sign_in', as: :sign_in
post '/session', to: 'session#create'
