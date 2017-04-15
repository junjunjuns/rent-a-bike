class Rental < ActiveRecord::Base
    belongs_to :bike
    belongs_to :profile
end
