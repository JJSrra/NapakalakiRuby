# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  class BadConsequence
    attr_reader :text, :levels
    
    @@MAXTREASURES = 10
		
		def self.MAXTREASURES
			@@MAXTREASURES
		end
    
    def is_empty
      raise NotImplementedError.new
    end
    
    def substract_visible_treasure(t)
      raise NotImplementedError.new
    end
    
    def substract_hidden_treasure(t)
      raise NotImplementedError.new
    end
    
    def adjust_to_fit_treasure_lists(v,h)
      raise NotImplementedError.new
    end
  end
end
