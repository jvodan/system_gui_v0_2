class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  rescue_from StandardError, :with => :handle_standard_error # if ( ENV['SEND_BUG_REPORTS'].present? && ENV['SEND_BUG_REPORTS'] == 'true' ) #if ( defined?(@bug_reports_enabled) && @bug_reports_enabled  )

  protect_from_forgery with: :exception

  # before_action :authenticate
  before_action :set_system
  before_action :authenticate

  # def authenticate_user!
  #   # super unless controller_name == 'portals'
  # end

  def set_system
    @system = System.instance
  end

  def page_title
    @system.label
  end

  def authenticate
    authenticate_user! unless controller_name == 'portals' && action_name == 'show'
  end

  # def after_sign_in_path_for(resource)
  #   system_path
  # end

  def handle_standard_error(error)
    if error.is_a?(Errno::ECONNREFUSED) || error.is_a?(RestClient::ResourceNotFound)
#       respond_to do |format|
#   format.js
#   format.yaml
# end
      render 'standard_errors/show', locals: { error: error }
    else
      raise
    end
  end

end
