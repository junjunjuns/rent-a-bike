class Bike < ActiveRecord::Base
    has_many :rental, :dependent => :destroy
    has_many :review
    
    def self.search(search)
        where("manufacturer LIKE ? OR color LIKE ? OR description LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
end
