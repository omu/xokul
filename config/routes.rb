Rails.application.routes.draw do
  namespace :yoksis do
    resources :references do
      collection do
        get :district
      end
    end
  end
end
