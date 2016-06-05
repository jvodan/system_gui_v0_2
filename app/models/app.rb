class App < ApplicationRecord

  has_image :icon
  # has_many :portal_apps, class_name: 'Portal::PortalEngine', foreign_key: :app_id

  before_create :set_defaults

  attr_accessor :state

  validates :label, length: { maximum: 16 }

  def set_defaults
    self.portal_show = true
  end

  def core_app
    @core_app ||= EnginesSystemCore::CoreApp.new(name)
  end

  def to_s
    name
  end

  def to_label
    label.present? ? label : to_s
  end

  def running?
    state.to_sym == :running
  end

  def environment_variables
    environments.map{ |e| { name: e.name.to_sym, value: e.value} }
  end

  def volumes_hash
    volumes_hash.map do |k,v|
      { name: v.name,
        remote_path: v.remotepath,
        local_path: v.localpath,
        mapping_permissions: v.mapping_permissions,
        volume_permissions: v.vol_permissions,
        service_type: v.serviceType }
    end
  end

  def perform_action(action)
    result = core_app.send action
    if result
      {type: :success, message: "Sent #{action} instruction."}
    else
      { type: :error, message: "Failed to send #{action} instruction." }
    end
  end

  def websites
    @websites ||= core_app.web_sites
    ['qqqqq.somesite.com', 'qqqqqq.anothersite.com']
  end


end
