class System < ApplicationRecord

  include EventStreams
  include Resources
  include ServiceConnections
  include Versions

  after_initialize :set_defaults

  has_image :icon

  validates :label, presence: true

  def self.instance
    first_or_create
  end

  def core_system
    @core_system ||= EnginesSystemCore::CoreSystem.new
  end

  def set_defaults
    return unless new_record?
    self.label = 'My Engines'
    self.background_color = '#5bc0de'
    self.text_color = '#ffffff'
    self.default_domain = 'mydomain.example'
  end

end
