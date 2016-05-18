class User
  class Profile < ApplicationRecord

    belongs_to :user
    belongs_to :portal

    def to_s
      user.username
    end

  end
end
