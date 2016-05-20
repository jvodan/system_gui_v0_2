class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :authenticate
  before_action :set_system
  before_action :authenticate_user!

  after_action :touch_system_events_listener

  # def authenticate_user!
  #   # super unless controller_name == 'portals'
  # end

  def set_system
    @system = System.instance
    # SystemEventsListenerJob.perform_now
  end

  def page_title
    @system.label
  end

  def touch_system_events_listener
    @@system_events_listener_thread =
        Thread.new { loop { p :job_started; SystemEventsListenerJob.perform_now; p :job_ended; sleep 1 } } unless
              defined?(@@system_events_listener_thread) &&
              @@system_events_listener_thread &&
              @@system_events_listener_thread.alive?
  end

end
