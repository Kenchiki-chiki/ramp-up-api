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
      resources :all_study_times
      resources :tasks do
        collection do
          delete 'destroy_all'
        end
        collection do
          get 'fetch_edit_task'
        end
      end
    end
  end

end
