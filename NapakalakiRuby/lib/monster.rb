#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
	class Monster
		attr_reader :name, :combat_level, :bad_consequence

		def initialize(name, level, bad_consequence, prize)
			@name = name
			@combat_level = level
			@bad_onsequence = bad_consequence
			@prize = prize
		end

		def get_levels_gained
			@prize.levels
		end

		def get_treasures_gained
			@prize.treasures
		end

		def to_s
			"Nombre: #{@name}\nNivel: #{@combat_level}\nMal rollo: #{@badConsequence}\nBuen rollo: #{@prize}"
		end
	end
end