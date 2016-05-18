class Service

  include ActiveModel::Model
  include ActiveModel::Validations
  include LabelData

  attr_accessor :name, :state

  def system
    System.instance
  end

  def core_service
    @core_service ||= EnginesSystemCore::Service.new(name)
  end

  def to_s
    name
  end

  def label
    label_data[name.to_sym][:label]
  end

  def icon
    label_data[name.to_sym][:icon]
  end

end
