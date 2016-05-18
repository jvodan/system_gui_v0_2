Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  root to: 'portals#show'

  devise_for :users
  resource :help, only: [:show]

  resources :portals do
    resources :portal_engines, except: [:index]
  end

  resource :system, only: [:show]
  namespace :system, module: :systems do
    resource :report
    resources :domains
    resources :libraries
    resource :display, only: [:show] do
      resource :admin_banner, only: [:edit, :update]
      resource :portal, only: [:edit, :update]
      resource :colors, only: [:edit, :update]
      resource :icon, only: [:edit, :update]
      resource :wallpaper, only: [:edit, :update]
    end
    resource :bug_reports, only: [:edit, :update]
    resource :admin, only: [:edit, :update]
    resources :users
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

  # namespace :machine, module: :machines do
  #   resource :status, only: [:show]
  # end

  namespace :engine, module: :app_engines do
    resource :control_panel, only: [:show]
    resource :action, only: [:show]
    resource :services, except: [:show]
    resource :report, only: [:show]
    resource :about, only: [:show]
    resource :display, only: [:edit, :update]
    resource :network, only: [:edit, :update]
    resource :resources, only: [:edit, :update]
    resource :variables, only: [:edit, :update]
    resource :installation, only: [:show]
    resource :uninstall, only: [:new, :create]
  end

  resource :installer, only: [:show]
  namespace :installers, module: :installers do
    resources :libraries, only: [:show]
    resource :installation, only: [:new, :create]
  end

  resources :services, only: [:index]
  namespace :service, module: :services do
    resource :control_panel, only: [:show]
    resource :action, only: [:show]
  end

end
