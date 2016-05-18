class AppEngine < ApplicationRecord

  has_image :icon
  has_many :portal_engines, class_name: 'Portal::PortalEngine', foreign_key: :engine_id

  attr_accessor :state

  validates :label, length: { maximum: 16 }

  def core_engine
    @core_engine ||= EnginesSystemCore::CoreEngine.new(name)
  end

  def to_s
    name
  end

  def to_label
    label || to_s
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



end
