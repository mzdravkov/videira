Videira::Application.routes.draw do
  root to: 'home#index'
  mount Beyond::Engine, at: '/'
  get "home/index"
  get "home/about"
end
