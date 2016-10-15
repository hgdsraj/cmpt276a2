Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/signup',  to: 'trainers#new'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/view',     to: 'trainers#show'
  get '/tokimons/battle', to: 'tokimons#battle'
  get '/tokimons/battler', to: 'tokimons#battler'

  resources :trainers
  resources :tokimons
end
