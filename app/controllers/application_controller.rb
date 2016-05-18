class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :authenticate
  before_action :set_system
  before_action :authenticate_user!

  # def authenticate_user!
  #   # super unless controller_name == 'portals'
  # end

  def set_system
    @system = System.instance
  end

  def page_title
    @system.label
  end

end
