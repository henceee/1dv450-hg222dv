class Creator < ActiveRecord::Base
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates   :name,                      presence: true,
                                            length: { minimum: 3}
    validates   :email,                     presence: true,
                                            format: { with: VALID_EMAIL_REGEX, on: :create },
                                            uniqueness: {case_sensitive: false}
    has_secure_password
   
    has_many :shows
    has_many :venues, through: :shows
end
