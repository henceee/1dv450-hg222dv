class Show < ActiveRecord::Base
    belongs_to :creator
    belongs_to :venue
    has_many   :artists
end
