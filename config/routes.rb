Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  root to: 'portals#show'

  devise_for :users
  resource :help, only: [:show]
  resource :connection, only: [:show]

  resources :portals do
    resources :portal_engines, except: [:index]
  end

  resource :system, only: [:show]
  namespace :system, module: :systems do
    resource :report
    resources :domains, only: [:index]
    resource :domain, only: [:new, :create, :edit, :update, :destroy]
    resources :libraries
    resource :display, only: [:edit, :update]
    resource :bug_reports, only: [:edit, :update]
    resource :admin, only: [:show]
    namespace :admin, module: :admins do
      resource :password, only: [:edit, :update]
      resource :email, only: [:edit, :update]
    end
    resource :certificate_upload, only: [:new, :create]
    resource :certificate_download, only: [:show]
    resource :usage, only: [:show] do
      resource :chart, only: [:show]
    end
    resource :activity, only: [:show] do
      resource :chart, only: [:show]
    end
    # The following resource expected to move to machine
    resource :registry, only: [:show]
    resource :logs, only: [:show]
    resource :key_upload, only: [:new, :create]
    resource :key_download, only: [:new, :create]
    resource :update_engines, only: [:show]
    resource :update_base_os, only: [:show]
    resource :reboot, only: [:new, :create]
  end

  # namespace :systems, module: :systems do
  #   resources :domains
  #   resources :libraries
  # end


  # namespace :machine, module: :machines do
  #   resource :status, only: [:show]
  # end

  namespace :app, module: :apps do
    resource :control_panel, only: [:show]
    resource :instruction, only: [:show]
    resource :services, except: [:show]
    resource :report, only: [:show]
    resource :about, only: [:show]
    resource :display, only: [:edit, :update]
    resource :network, only: [:edit, :update]
    resource :resources, only: [:edit, :update]
    resource :variables, only: [:edit, :update]
    # resource :installation, only: [:show]
    resource :uninstall, only: [:new, :create]
    resource :first_run, only: [:show]
    resource :installation_report, only: [:show]
  end

  # resource :installer, only: [:show]
  namespace :installers, module: :installers do
    resource :library, only: [:show]
    resource :repository, only: [:new]
    resource :new_app, only: [:new, :create]
    resource :build, only: [:show]
    resource :build_events, only: [:show]
  end

  resources :services, only: [:index]
  namespace :service, module: :services do
    resource :control_panel, only: [:show]
    resource :instruction, only: [:show]
  end

end
