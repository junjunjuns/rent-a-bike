class Review < ActiveRecord::Base
    belongs_to :bike
    belongs_to :profile
end
