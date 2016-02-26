class Setlist < ActiveRecord::Base
    belongs_to :artist
    belongs_to :show
end
