class Show < ActiveRecord::Base
    belongs_to :creator
    belongs_to :venue
    has_many :setlists
    has_many :artists, :through => :setlists
    validates :name,        presence: true
    validates :description, presence: true
end
