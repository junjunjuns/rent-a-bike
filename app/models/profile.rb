class Profile < ActiveRecord::Base
    belongs_to :user
    has_many :review
    has_many :rental
end
