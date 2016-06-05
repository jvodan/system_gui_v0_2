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
    return label_data[name.to_sym][:label] if label_data[name.to_sym]
    name.to_s.humanize
  end

  def icon
    return label_data[name.to_sym][:icon] if label_data[name.to_sym]
    'fa-square-o'
  end

end
