class Machine < ApplicationRecord


  def core_machine
    EnginesSystemCore::Machine.new(ip, secret)
  end

  def engines
    core_machine.engines
  end

  def running_engines
    engines.select &:running?
  end

  def to_s
    ip
  end

  def to_label
    label || to_s
  end

end
