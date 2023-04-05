require 'rspec'
require './lib/passenger'

RSpec.describe Passenger do
  it "exists" do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    expect(charlie).to be_an_instance_of(Passenger)
  end

  it "has attributes" do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    expect(charlie.name).to eq("Charlie")
    expect(charlie.age).to eq(18)
    expect(taylor.name).to eq("Taylor")
    expect(taylor.age).to eq(12)
  end

  it "can determine if a passenger is an adult" do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    expect(charlie.adult?).to eq(true)
    expect(taylor.adult?).to eq(false)
  end

  it "can determine if a passenger is a driver" do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    expect(charlie.driver?).to eq(false)
    expect(taylor.driver?).to eq(false)
  end

  it "can set a passenger to a driver" do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    expect(charlie.driver?).to eq(false)
    charlie.drive
    expect(charlie.driver?).to eq(true)
  end
end