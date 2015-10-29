#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
	attr_reader :text, :levels, :nVisible, :nHidden, :death, :specificVisibleTreasures, :specificHiddenTreasures
	
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures,
				someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @text = aText
		@levels = someLevels
		@nVisible = someVisibleTreasures
		@nHidden = someHiddenTreasures
		@death = death
		
		@specificHiddenTreasures = someSpecificHiddenTreasures
		@specificVisibleTreasures = someSpecificVisibleTreasures
  end
	private_class_method :new
	
	def self.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
		# Asigna memoria para el objeto
		nuevo_bc = allocate
		
		# Inicializa el objeto
		nuevo_bc.send(:initialize, aText, someLevels, someVisibleTreasures, someHiddenTreasures, [], [], false)
		
		# Return
		nuevo_bc
	end
	
	def self.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
		nuevo_bc = allocate
		nuevo_bc.send(:initialize, aText, someLevels, nil, nil, someSpecificVisibleTreasures, someSpecificHiddenTreasures, false)
		
		nuevo_bc
	end
	
	def self.newDeath(aText)
		nuevo_bc = allocate
		nuevo_bc.send(:initialize, aText, nil, nil, nil, nil, nil, true)
		
		nuevo_bc
	end
	
	def to_s
		"#{@text}\n\tNiveles: #{@levels}\n\tNumero tesoros visibles: #{@nVisible}\n\tNumero tesoros ocultos: #{@nHidden}\n\tTesoros visibles especificos: #{@specificVisibleTreasures}\n\tTesoros ocultos especificos: #{@specificHiddenTreasures}\n\tMuerte: #{@death}"
	end
end
