# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
get '/session/sign-in', to: 'session#sign_in', as: :sign_in
post '/session', to: 'session#create'
get '/home', to: 'home#index', as: :home
