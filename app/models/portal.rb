class Portal < ApplicationRecord

  has_image :icon
  has_image :wallpaper

  has_many :portal_engines, dependent: :destroy
  has_many :engines, through: :portal_engines

  # enum show_engines: [:installed, :running, :select]

  attr_accessor :default_portal

  def self.for(system, current_user)
    return new(default_portal_params(system)) if
      current_user.nil? || current_user.is_admin? || current_user.profile.nil?
    current_user.portal
  end

  def system
    System.instance
  end

  def portal_engines
    if default_portal; system.engines
    else; super.engines
    end.select(&:running?).map(&:portal_engines).map(&:build)
  end

  private

  def self.default_portal_params(system)
    {
      label: system.label,
      background_color: system.background_color,
      text_color: system.text_color,
      icon: system.icon,
      default_portal: true
    }
  end

end
