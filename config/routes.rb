Btcbrite::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'registrations#new'
  get 'pay/:network', to: 'registrations#pay'
  post 'pay/:network/status', to: 'registrations#payment_status'

  get 'networks', to: "network#status"

end
