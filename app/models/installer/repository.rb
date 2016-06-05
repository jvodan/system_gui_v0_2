class Installer
  class Repository < ApplicationRecord

    # before_create :set_blueprint

    self.table_name = :installer_repositories

    serialize :blueprint

    has_one :new_app, dependent: :destroy
    belongs_to :library, class_name: '::Systems::Library', foreign_key: :library_id

    def load_blueprint
      load_raw_blueprint
      self.blueprint = parsed_blueprint
      save
    rescue
      return false
    end

    def parsed_blueprint
      JSON.parse(raw_blueprint, symbolize_names: true)[:software]
    rescue
      errors.add(:base, "Failed to parse blueprint JSON.")
      raise
    end

    def load_raw_blueprint
      self.raw_blueprint =
        EnginesRepositories::Blueprint.new(repository_url).blueprint
    rescue
      errors.add(:base, "Failed to load blueprint from repository.")
      raise
    end

  end
end
