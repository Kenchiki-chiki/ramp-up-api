Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :skills
      resources :study_times
      resources :bar_charts
      resources :pie_charts
      resources :calendars
    end
  end

end
