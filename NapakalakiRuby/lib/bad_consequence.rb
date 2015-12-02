#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
	class BadConsequence
		attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death, :specificVisibleTreasures, :specificHiddenTreasures

		@@MAXTREASURES = 10

		def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures,
					someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
			@text = aText
			@levels = someLevels
			@nVisibleTreasures = someVisibleTreasures
			@nHiddenTreasures = someHiddenTreasures
			@death = death

			@specificHiddenTreasures = someSpecificHiddenTreasures
			@specificVisibleTreasures = someSpecificVisibleTreasures
		end
		private_class_method :new
		
		def self.MAXTREASURES
			@@MAXTREASURES
		end

		def self.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
			# Asigna memoria para el objeto
			nuevo_bc = allocate

			# Inicializa el objeto
			nuevo_bc.send(:initialize, aText, someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new, false)

			# Return
			nuevo_bc
		end

		def self.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
			nuevo_bc = allocate
			nuevo_bc.send(:initialize, aText, someLevels, 0, 0, someSpecificVisibleTreasures, someSpecificHiddenTreasures, false)

			nuevo_bc
		end

		def self.newDeath(aText)
			nuevo_bc = allocate
			nuevo_bc.send(:initialize, aText, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES, Array.new, Array.new, true)

			nuevo_bc
		end

		def is_empty
			return (@nVisibleTreasures == 0 and nHiddenTreasures == 0 and
							@specificVisibleTreasures.empty? and @specificHiddenTreasures.empty?)
		end

		def substract_visible_treasure(t)
      if (@specificVisibleTreasures.empty? and @nVisibleTreasures > 0)
        @nVisibleTreasures -= 1
      else
        index = @specificVisibleTreasures.find_index(t.type)
        if (index != nil)
          @specificVisibleTreasures.delete_at(index)
        end
      end
		end

		def substract_hidden_treasure(t)
			if (@specificHiddenTreasures.empty? and @nHiddenTreasures > 0)
        @nHiddenTreasures -= 1
      else
        index = @specificHiddenTreasures.find_index(t.type)
        if (index != nil)
          @specificHiddenTreasures.delete_at(index)
        end
      end
		end

		def adjust_to_fit_treasure_lists(v, h)
      bc = nil
      nVisible = 0
      nHidden = 0
      
      if (@specificVisibleTreasures.empty? and @specificHiddenTreasures.empty?)
        if (v.size < @nVisibleTreasures)
          nVisible = v.size
        end
        if (h.size < @nHiddenTreasures)
          nHidden = h.size
        end
        
        bc = BadConsequence.newLevelNumberOfTreasures(@text, @levels, nVisible, nHidden)
      else
				# Si hay tesoros específicos, bc debe llevar la intersección
				auxV = Array.new
				auxH = Array.new
				
				v.each { |treasure| 
					if @specificVisibleTreasures.find_index(treasure.type) != nil
						auxV.push(treasure.type)
					end
				}
				
				h.each { |treasure| 
					if @specificHiddenTreasures.find_index(treasure.type) != nil
						auxH.push(treasure.type)
					end
				}
				
        bc = BadConsequence.newLevelSpecificTreasures(@text, @levels, auxV, auxH)
      end
      
      bc
		end

    public
		def to_s
			"#{@text}\n\tNiveles: #{@levels}\n\tNumero tesoros visibles: #{@nVisibleTreasures}\n\tNumero tesoros ocultos: #{@nHiddenTreasures}\n\tTesoros visibles especificos: #{@specificVisibleTreasures}\n\tTesoros ocultos especificos: #{@specificHiddenTreasures}\n\tMuerte: #{@death}"
		end
	end
end