Rails.application.routes.draw do

  root to: "users#show", :as => "user_profile"

  devise_for :users,
             controllers: {
                            sessions: 'users/sessions',
                            omniauth_callbacks: 'users/omniauth_callbacks'
                          }

  # we need a welcome page of some kind.

  resources :users, except: [:new, :create, :destroy]

  resources :events do
    resources :items
    resources :guestlists, only: [:index] do
      collection do
        get 'invite_list'
        post 'invite'
      end
    end
  end


end
