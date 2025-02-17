require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
    before(:each) do
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @jude = Passenger.new({"name" => "Jude", "age" => 20})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    end


    describe '#initialize' do
        it 'can initialize vehicle class' do
            expect(@vehicle).to be_an_instance_of(Vehicle)
            expect(@vehicle.year).to eq("2001")
            expect(@vehicle.make).to eq("Honda")
            expect(@vehicle.model).to eq("Civic")
        end
    end

    describe '#speeding?' do
        it 'can check if a vehicle was speeding' do
            expect(@vehicle.speeding?).to eq (false)
            @vehicle.speed
            expect(@vehicle.speeding?).to eq (true)
        end
    end
    
    describe '#passengers' do
        it 'returns an array of passengers in the vehicle' do
            expect(@vehicle.passengers).to eq([])
            @vehicle.add_passenger(@charlie)
            @vehicle.add_passenger(@jude)
            @vehicle.add_passenger(@taylor)
            expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
        end
    end

    describe '#num_adults' do
        it 'counts the number of adults in a vehicle' do
            puts @vehicle.passengers
            expect(@vehicle.num_adults).to eq(2)
        end
    end
        
end
