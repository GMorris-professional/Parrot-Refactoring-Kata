class Parrot
  def initialize(type, number_of_coconuts, voltage, nailed)
    @type = Type.for(type, number_of_coconuts, voltage, nailed)
  end

  def speed
    @type.speed
  end
end

class Type
  class European < Type
    def initialize
    end

    def speed
      return base_speed
    end

    private
      def base_speed
        12.0
      end
  end
  class African < Type
    def initialize(number_of_coconuts)
      @number_of_coconuts = number_of_coconuts
    end

    def speed
      return [0, base_speed - load_factor * @number_of_coconuts].max
    end

    private
      def base_speed
        12.0
      end

      def load_factor
        9.0
      end
  end
  class NorwegianBlue < Type
    def initialize(voltage, nailed)
      @voltage = voltage
      @nailed = nailed
    end

    def speed
      return (@nailed) ? 0 : [24.0, @voltage * base_speed].min
    end

    private
      def base_speed
        12.0
      end
  end

  def self.for(type, number_of_coconuts, voltage, nailed)
    case type
    when :european_parrot
      European.new()
    when :african_parrot
      African.new(number_of_coconuts)
    when :norwegian_blue_parrot
      NorwegianBlue.new(voltage, nailed)
    end
  end
end
