class System
  class Library < ApplicationRecord

    # self.table_name = :libraries

    def self.engines_library
      new name: 'Engines library',
          url: 'https://engineslibrary.engines.org'
    end

    def to_s
      name
    end

  end
end
