module OAuth2
  module Scopes
    module Included; end
    
    def check_scopes(arr)
      puts Included.instance_methods(false).inspect
      (Included.instance_methods(false) & arr.collect{|a|a.to_sym}).each do |method|
        self.send method
      end
    end    
    include Included

  end
end