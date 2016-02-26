class Venue < ActiveRecord::Base
    has_many :shows
    has_many :creators, through: :shows
    
    geocoded_by :adress
    
    validates :longitude, numericality: true,  presence: true
    validates :latitude,  numericality: true,  presence: true
    validates :latitude,  presence: true
end
