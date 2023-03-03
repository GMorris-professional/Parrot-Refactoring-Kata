class Parrot

  class Type
    def self.for(type)
      new(type)
    end

    def initialize(type)
      @type = type
    end
    attr_reader :type
  end

  def initialize(type, number_of_coconuts, voltage, nailed)
    @type = Type.for(type)
    @number_of_coconuts = number_of_coconuts
    @voltage = voltage
    @nailed = nailed
  end

  def speed
    case @type.type
    when :european_parrot
      return base_speed
    when :african_parrot
      return [0, base_speed - load_factor * @number_of_coconuts].max
    when :norwegian_blue_parrot
      return (@nailed) ? 0 : compute_base_speed_for_voltage(@voltage)
    end

    throw "Should be unreachable!"
  end

  private

  def compute_base_speed_for_voltage(voltage)
    [24.0, voltage * base_speed].min
  end

  def load_factor
    9.0
  end

  def base_speed
    12.0
  end
end
