Rails.application.routes.draw do
  resources :teachers do
    resources :teacher_subjects, shallow: true
  end
  resources :subjects
  resources :sections, only: %i[index]
  resources :schedules, only: %i[create destroy]
  root to: 'sections#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
