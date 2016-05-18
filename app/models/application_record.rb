class ApplicationRecord < ActiveRecord::Base

  extend ImageClass
  include ImageInstance
  extend DataType

  self.abstract_class = true

  def to_s
    "#{self.class.name.humanize} #{id}"
  end

end
