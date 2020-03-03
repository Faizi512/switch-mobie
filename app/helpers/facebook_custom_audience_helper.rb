module FacebookCustomAudienceHelper
  require 'digest'  
  def hash_256(value)
    Digest::SHA2.hexdigest value    
  end
end
