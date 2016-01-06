# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  class SpecificBadConsequence < BadConsequence
    attr_reader :specificVisibleTreasures, :specificHiddenTreasures
    
    def initialize(text, levels, tVisible, tHidden)
      @text = text
      @levels = levels
      @specificVisibleTreasures = tVisible
      @specificHiddenTreasures = tHidden
    end
    
    def is_empty
      @specificVisibleTreasures.empty? and @specificHiddenTreasures.empty?
    end
    
    def substract_visible_treasure(t)
      index = @specificVisibleTreasures.find_index(t.type)
      if (index != nil)
        @specificVisibleTreasures.delete_at(index)
      end
    end
    
    def substract_hidden_treasure(t)
      index = @specificHiddenTreasures.find_index(t.type)
      if (index != nil)
        @specificHiddenTreasures.delete_at(index)
      end
    end
    
    def adjust_to_fit_treasure_lists(v,h)
      bc = nil
      auxV = Array.new
      auxH = Array.new
      specificV = Array(@specificVisibleTreasures)
      specificH = Array(@specificHiddenTreasures)
      
      v.each { |treasure| 
        index = specificV.find_index(treasure.type)
        
        if index != nil
          auxV.push(treasure.type)
          specificV.delete_at(index)
        end
      }
      
      h.each { |treasure| 
        index = specificH.find_index(treasure.type)
        
        if index != nil
          auxH.push(treasure.type)
          specificH.delete_at(index)
        end
      }
      
      bc = BadConsequence.newLevelSpecificTreasures(@text, @levels, auxV, auxH)
      
      bc
    end
    
    def to_s
      "#{@text}\n\tNiveles: #{@levels}\n\tTesoros visibles especificos: #{@specificVisibleTreasures}\n\tTesoros ocultos especificos: #{@specificHiddenTreasures}\n"
    end
  end
end
