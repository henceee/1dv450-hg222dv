class Artist < ActiveRecord::Base
    has_many :setlists
    has_many :shows, :through=> :setlists
    validates   :name,                      presence: true
end
