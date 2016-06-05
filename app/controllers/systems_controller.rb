class SystemsController < ApplicationController

  # after_action :check_system_errors

  # def show
  #   render html: @system.core_system.cpus_usage, layout: 'application'
  #   # render text:
  # end


  def show
    # render text: downcase_keys({'FOO' => 'on', 'BAR' => 'off'})
    # EventBroadcastJob.perform_later("hi")
    # render html: '', layout: 'application'
    # render html: @system.core_system.system_events, layout: 'application'
  end


  # def check_system_errors
  #   p :controller_system_errs
  #   p @system.errors
  #
  #       flash[:alert] = @system.errors[:base].join(' ') if @system.errors[:base].present?
  # end



end
