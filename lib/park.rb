class Park
  attr_reader :name, :admission_price, 
              :vehicles, :passengers,
              :revenue

  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
    @passengers = []
    @revenue = 0
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle

    #adds each passenger to @passengers when a vehicle is added to the park & charges admission
    vehicle.passengers.each do |passenger|
      @passengers << passenger
      if passenger.adult?
        @revenue += @admission_price
      end
    end
  end

end