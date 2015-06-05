class Airplane
  attr_reader :type, :wing_loading, :horsepower
  attr_accessor :location, :engine_on

  def initialize(type, wing_loading, horsepower)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @engine_on = false
    @location = 'ground'
  end

  def start
    @engine_on = true
  end

  def takeoff
    if @location == 'airborne'
      return "You can't takeoff while flying"
    elsif @engine_on == true
      @location = 'airborne'
      return @location
    else
      'Turn me on first!'
    end
  end

  def landing
    if @location == 'ground'
      return "You can't land when you're on the ground!"
    elsif @engine_on == true
      @location = 'ground'
      return @location
    else
      'Turn me on first!'
    end
  end

  def turn_off
    @engine_on = false
  end

end
