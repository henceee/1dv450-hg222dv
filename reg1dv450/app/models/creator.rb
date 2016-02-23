class Creator < ActiveRecord::Base
    belongs_to :user
    has_many :shows
    has_many :venues, through: :shows
end
