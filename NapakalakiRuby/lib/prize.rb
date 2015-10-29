#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
	attr_reader :treasures, :levels
	
  def initialize(treasures, levels)
    @treasures = treasures
		@levels = levels
  end
	
	def to_s
		"Tesoros ganados: #{@treasures}\n\tNiveles ganados: #{@levels}"
	end
end
