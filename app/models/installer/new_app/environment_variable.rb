class Installer
  class NewApp
    class EnvironmentVariable < ApplicationRecord

      belongs_to :new_app, optional: true
      has_one :field, as: :field_consumer, dependent: :destroy
      accepts_nested_attributes_for :field

      # validates :create_type, inclusion: { in: create_type_collection.map(&:first) }




    end
  end
end
