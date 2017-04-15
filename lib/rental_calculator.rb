class RentalCalculator
    def initialize(start_date, end_date)
        @start_date = start_date
        @end_date = end_date
    end
    
    def calculate()
        @days = (@end_date - @start_date).to_i
        if @days <1
            @costs = 5
        else
            @costs = @days * 5
        end
        return @costs
    end
end