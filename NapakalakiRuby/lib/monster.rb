#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
	attr_reader :name, :level, :badConsequence, :prize
	
  def initialize(name, level, badConsequence, prize)
    @name = name
		@level = level
		@badConsequence = badConsequence
		@prize = prize
  end
	
	def to_s
		"Nombre: #{@name}\nNivel: #{@level}\nMal rollo: #{@badConsequence}\nBuen rollo: #{@prize}"
	end
end
