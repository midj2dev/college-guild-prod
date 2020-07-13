Rails.application.routes.draw do

  root 'static_pages#home'

  resources :courses, except: [:show]

  resources :sessions, only: [:create, :new, :destroy]

  resources :certificate, only: :index

  resources :prisoners, only: [:create, :update, :show, :index, :edit] do
    resources :units, only: [:create, :update]
  end

  resources :volunteers, only: [:create, :update, :show, :index, :edit]

  resources :units, only: [:update, :show, :index] do
    resources :assigns, only: :update
    resources :volunteers, only: [:show] do
      resources :assigns, only: [:create]
    end
  end
  get 'completed_units' => 'units#completed_units'

  get 'reports/attrs' => 'reports#attrs'
  resources :reports, only: [:index, :show, :create, :new, :destroy]

  get '/sub_course/:id' => 'units#find_sub_courses'
  post '/dictionary' => 'prisoners#dictionary'
  post '/vacation' => 'volunteers#vacation'
  get '/waitlist' => 'prisoners#waitlist'
  get '/late/:days' => 'units#late'
  post '/:prisoner_id/certificate' => 'certificate#create'
  get '/course_overview' => 'static_pages#courses'
  post '/delete_vacation' => 'volunteers#delete_vacation'

  get '/units/destroy/:id' => "api/units#destroy"

end
