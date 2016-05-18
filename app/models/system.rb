class System < ApplicationRecord

  before_validation :set_defaults

  has_image :icon

  validates :label, presence: true

  def self.instance
    first_or_create
  end

  def core_system
    @core_system ||= EnginesSystemCore::CoreSystem.new
  end

  def portal_for(current_user)
    Portal.for(self, current_user)
  end

  def domains
    core_system.list_domains.map(&:second).map do |domain|
      Domain.new(domain)
    end.sort_by(&:domain_name)
  end

  def libraries
    [Library.engines_library] + Library.all.order('name ASC')
  end

  def machines
    Machine.create(ip: :local) if Machine.all.empty?
    Machine.all
  end

  def engines
    core_system.engine_states.map do |name, state|
      AppEngine.where(name: name).first_or_create.tap{ |engine| engine.state = state }
    end.sort_by &:name
  end

  def services
    core_system.service_states.map do |name, state|
      Service.new(name: name, state: state)
    end.sort_by &:name
  end


#   def running_engines
#     x = engines
#     y = engines.select(&:running?)
#
# p :x
# p x
#
# p :y
# p y
#
#
#   end

  # def portal_engines
  #   systems.map(&:running_engines)
  # end

  def set_defaults
    self.label = 'My Engines'
    self.background_color = '#5bc0de'
    self.text_color = '#ffffff'
  end

end
