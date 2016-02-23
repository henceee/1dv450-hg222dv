class Venue < ActiveRecord::Base
    validates :longitude, numericality: true
    validates :latitude,  numericality: true
    has_many :shows
    has_many :creators, through: :shows
end
