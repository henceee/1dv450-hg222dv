class Application < ActiveRecord::Base
    
     validates   :name,                      presence: true,
                                             uniqueness: {case_sensitive: false}
     
      require 'securerandom'

     before_create :createKey
     
    belongs_to :user
    
    private
    def createKey
         self.key = SecureRandom.hex
    end
end
