# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  class NumericBadConsequence < BadConsequence
    def initialize(text, levels, nVisible, nHidden)
      @text = text
      @levels = levels
      @nVisibleTreasures = nVisible
      @nHiddenTreasures = nHidden
    end
    
    def is_empty
      @nVisibleTreasures == 0 and @nHiddenTreasures == 0
    end
    
    def substract_visible_treasure(t)
      @nVisibleTreasures -= 1
    end
    
    def substract_hidden_treasure(t)
      @nHiddenTreasure -= 1
    end
    
    def adjust_to_fit_treasure_lists(v,h)
      bc = nil
      nVisible = 0
      nHidden = 0
      
      if (v.size < @nVisibleTreasures)
        nVisible = v.size
      else
        nVisible = @nVisibleTreasures
      end
      
      if (h.size < @nHiddenTreasures)
        nHidden = h.size
      else
        nHidden = @nHiddenTreasure
      end
      
      bc = NumericBadConsequence.new(@text, @levels, nVisible, nHidden)
      
      bc
    end
    
    def to_s
      "#{@text}\n\tNiveles: #{@levels}\n\tNumero tesoros visibles: #{@nVisibleTreasures}\n\tNumero tesoros ocultos: #{@nHiddenTreasures}\n"
    end
  end
end