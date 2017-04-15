class Bike < ActiveRecord::Base
    has_many :rental
    has_many :review
end
