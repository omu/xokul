Rails.application.routes.draw do
  namespace :yoksis do
    resources :units do
      collection do
        get :universities
      end
    end
  end
end
