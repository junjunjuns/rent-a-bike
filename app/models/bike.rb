class Bike < ActiveRecord::Base
    has_many :rental
    has_many :review
    
    def self.search(search)
        where("name LIKE ?", "%#{search}%")
    end
end
