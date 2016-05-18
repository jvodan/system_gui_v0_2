class Portal
  class PortalEngine < ApplicationRecord

    self.table_name = :portal_engines

    belongs_to :portal
    belongs_to :engine, class_name: 'AppEngine' #, foreign_key: :engine_id

  end
end
