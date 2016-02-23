class Artist < ActiveRecord::Base
    validates   :name,                      presence: true
    has_many :shows
end
