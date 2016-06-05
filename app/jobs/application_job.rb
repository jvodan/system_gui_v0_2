class ApplicationJob < ActiveJob::Base

  def broadcast_event(view_js)
    EventBroadcastJob.perform_later(view_js)
  end

end
