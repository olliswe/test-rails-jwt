Rails.application.routes.draw do
  get 'notes/:id/:foo', to: 'notes#show', foo: /[A-Z]\d{5}/
  resources :notes, except: [:show] do
    resources :note_images
    post 'send_sharing_email', on: :member
    delete 'destroy_all_notes', on: :collection
  end
  namespace :auth do
    resource :users, only: [:create] do
      post :login
      get :me
    end
  end
end
