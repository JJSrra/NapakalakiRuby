# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'player.rb'
require_relative 'combat_result.rb'

module Napakalaki
  require 'singleton'
  class Napakalaki
    include Singleton

    attr_reader :currentPlayer, :currentMonster

    def initialize
      @currentPlayer = nil
      @currentMonster = nil
      @players = Array.new
    end

    def develop_combat

    end

    def discard_visible_treasures(treasures)

    end

    def discard_hidden_treasures(treasures)

    end

    def make_treasures_visible(treasures)

    end

    def init_game(players)

    end

    def next_turn

    end

    def end_of_game(result)
			result == CombatResult::WINGAME
    end

    private
    def init_players(names)
			names.each { |name| 
				@players.push(Player.new(name))
			}
    end
    
    def next_player
      if (@current_player == nil) then
        indice = 1 + rand(@players.size)
      else
        indice = @players.index(@current_player)
        indice = indice + 1
      end
      
      @current_player = @players[indice]
    end

    def next_turn_allowed
      @current_player.valid_state
    end

    def set_enemies
      array_players = Array.new
      array_enemies = Array.new
      @players.each_index { |index|
        array_players[index] = index
        array_enemies[index] = index
      }
      
      finished = false
      while (!finished)
        array_enemies.shuffle!
        
        abort = false
        while (!abort)
          for i in 0..array_players.size-1
            if (array_players.at(i) != array_enemies.at(i) && array_players.at(i+1) != array_enemies.at(i+1) && !finished)
              # Asignar al jugador players[1] el enemigo enemies[i] y sacarlos de los arrays
              @players.at(array_players.shift).set_enemy(@players.at(array_enemies.shift))
              if (i+1 == array_players.size)
                @players.at(array_players.shift).set_enemy(@players.at(array_enemies.shift))
                finished = true
              end
            else
              abort = true
            end
          end
        end
      end
    end
  end
end
