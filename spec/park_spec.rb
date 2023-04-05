require 'rspec'
require './lib/passenger'
require './lib/vehicle'
require './lib/park'

RSpec.describe Park do
  it "exists" do
    park = Park.new("Grand Canyon", 25)
    expect(park).to be_an_instance_of(Park)
  end

  it "has attributes" do
    park = Park.new("Grand Canyon", 25)
    expect(park.name).to eq("Grand Canyon")
    expect(park.admission_price).to eq(25)
  end

  it "can list vehicles that have entered the park" do
    park = Park.new("Grand Canyon", 25)
    expect(park.vehicles).to eq([])
  end

  it "can add vehicles to the park" do
    park = Park.new("Grand Canyon", 25)
    vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle2 = Vehicle.new("2019", "Ferrari", "F50")
    vehicle3 = Vehicle.new("2010", "Ford", "Focus")
    park.add_vehicle(vehicle1)
    park.add_vehicle(vehicle2)
    park.add_vehicle(vehicle3)
    expect(park.vehicles).to eq([vehicle1, vehicle2, vehicle3])
  end

  it "can list passengers that have entered the park in a vehicle" do
    park = Park.new("Grand Canyon", 25)
    expect(park.passengers).to eq([])

    vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle2 = Vehicle.new("2019", "Ferrari", "F50")
    vehicle3 = Vehicle.new("2010", "Ford", "Focus")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    john = Passenger.new({"name" => "John", "age" => 34})
    mary = Passenger.new({"name" => "Mary", "age" => 55})
    tom = Passenger.new({"name" => "Tom", "age" => 4})
    vehicle1.add_passenger(charlie)
    vehicle1.add_passenger(jude)
    vehicle1.add_passenger(taylor)
    vehicle2.add_passenger(john)
    vehicle2.add_passenger(mary)
    vehicle3.add_passenger(tom)
    park.add_vehicle(vehicle1)
    park.add_vehicle(vehicle2)
    park.add_vehicle(vehicle3)

    expect(park.passengers).to eq([charlie, jude, taylor, john, mary, tom])
  end

  it "can calculate revenue from the admission price of each adult passenger" do
    park = Park.new("Grand Canyon", 25)
    vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle2 = Vehicle.new("2019", "Ferrari", "F50")
    vehicle3 = Vehicle.new("2010", "Ford", "Focus")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    john = Passenger.new({"name" => "John", "age" => 34})
    mary = Passenger.new({"name" => "Mary", "age" => 55})
    tom = Passenger.new({"name" => "Tom", "age" => 4})
    vehicle1.add_passenger(charlie)
    vehicle1.add_passenger(jude)
    vehicle1.add_passenger(taylor)
    vehicle2.add_passenger(john)
    vehicle2.add_passenger(mary)
    vehicle3.add_passenger(tom)
    park.add_vehicle(vehicle1)
    park.add_vehicle(vehicle2)
    park.add_vehicle(vehicle3)

    expect(park.revenue).to eq(100)
  end
end