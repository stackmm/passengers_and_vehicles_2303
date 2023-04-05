class Park
  attr_reader :name, :admission_price, :vehicles

  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def passengers
    list_of_passengers = []
    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        list_of_passengers << passenger
      end
    end
    list_of_passengers
  end

  def revenue
    revenue = 0

    @vehicles.each do |vehicle|
      vehicle.passengers.each do |passenger|
        if passenger.adult?
          revenue += @admission_price
        end
      end
    end
    revenue
  end

  def all_attendees
    passengers.map do |passenger|
      passenger.name
    end.sort
  end

  def minors
    minors = passengers.find_all do |passenger|
      !passenger.adult?
    end

    minors.map do |minor|
      minor.name
    end.sort
  end

end