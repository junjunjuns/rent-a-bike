class BasicBike
    def initialize(color)
        @cost = 0
        @color = color
        @description = "basic bike"
    end
    
    # getter method
    def cost
        return @cost
    end
    
    # a method which returns a string representation of the object of type BasicCar
    def details
        return @description + "; " + @color + ": " + "#{@cost}"
    end
    
    # getter method
    def color
        return @color
    end
    
    # getter method
    def model 
        return @model
    end
end

class BikeDecorator < BasicBike
    def initialize(basic_bike)
        @basic_bike = basic_bike
        @extra_cost = 0
        @description = "no accessories"
    end
    
    def cost      
        return @extra_cost + @basic_bike.cost
    end
    
    def details
        return  @description + ": " + "#{@extra_cost}" + ". " + @basic_bike.details
    end
end 

class SaddleBagDecorator < BikeDecorator
    def initialize(basic_bike)
        super(basic_bike)
        @extra_cost = 5
        @description = "Topeak Aero Wedge Saddle Bag - With Strap"
    end
end

class StabiliserDecorator < BikeDecorator
    def initialize(basic_bike)
        super(basic_bike)
        @extra_cost = 10
        @description = "Aide Bike Stabilisers 12-20"
    end
end

class ChildBuggyDecorator < BikeDecorator
    def initialize(basic_bike)
        super(basic_bike)
        @extra_cost = 50
        @description = "Halfords Double Buggy Child Bike Trailer"
    end
end

class ChildSeatDecorator < BikeDecorator
    def initialize(basic_bike)
        super(basic_bike)
        @extra_cost = 50
        @description = "Hamax Kiss Rear Child Bike Seat - Grey and Green"
    end
end

class WaterResistantBagDecorator < BikeDecorator
    def initialize(basic_bike)
        super(basic_bike)
        @extra_cost = 10
        @description = "Basil Mara XL Water Resistant Double Pannier Bag - 35L"
    end
end

class EyeMirrorDecorator < BikeDecorator
    def initialize(basic_bike)
        super(basic_bike)
        @extra_cost = 5
        @description = "The Bike Eye Bike Mirror will definitely keep you aware of your surroundings with this rear view mirror. Not only is this really easy fittings but also improves your safety!"
    end
end

class BellDecorator < BikeDecorator
    def initialize(basic_bike)
        super(basic_bike)
        @extra_cost = 1
        @description = "Add a twist to your bike with the classic looking Halfords Black Bike Bell.  It'll easily clear the path ahead thanks to its clear ringing noice"
    end
end

class EndMirrorDecorator < BikeDecorator
    def initialize(basic_bike)
        super(basic_bike)
        @extra_cost = 4
        @description = "Safety is something often overlooked on a bike but when riding in traffic you can't be too careful, hence the Halfords Bar End Bike Mirror. This mirror easily attaches to the end of your handlebars and is fully adjustable so you can alway see around you whilst still looking straight ahead."
    end
end

class HornDecorator < BikeDecorator
    def initialize(basic_bike)
        super(basic_bike)
        @extra_cost = 5
        @description = "Indulge your love for old fashioned England with the Real Bugle Bike Horn. This horn wouldn't look out of a place on a turn of the century new fangled motor car and we wholeheartedly support your decision to bring this bit of old worlde charm into the present. Tally ho, old bean!"
    end
end