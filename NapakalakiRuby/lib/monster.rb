#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
	class Monster
		attr_reader :name, :combat_level, :bad_consequence

		def initialize(name, level, bad_consequence, prize, lc)
			@name = name
			@combat_level = level
			@bad_consequence = bad_consequence
			@prize = prize
      @level_change_against_cultist_player = lc
		end
    private_class_method :new
    
    def self.new_normal_monster(name, level, bc, prize)
      new_monster = allocate

			new_monster.send(:initialize, name, level, bc, prize, 0)

			new_monster
    end
    
    def self.new_cultist_monster(name, level, bc, prize, lc)
      new_monster = allocate
      
      new_monster.send(:initialize, name, level, bc, prize, lc)
      
      new_monster
    end


		def get_levels_gained
			@prize.levels
		end

		def get_treasures_gained
			@prize.treasures
		end
    
    def get_combat_level_against_cultist_player()
      @combat_level + @level_change_against_cultist_player
    end
    
		def to_s
			"Nombre: #{@name}\nNivel: #{@combat_level}\nMal rollo: #{@bad_consequence}\nBuen rollo: #{@prize}"
		end
	end
end