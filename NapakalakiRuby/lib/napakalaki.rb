# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'player.rb'
require_relative 'combat_result.rb'
require_relative 'card_dealer.rb'

module Napakalaki
  require 'singleton'
  class Napakalaki
    include Singleton

    attr_reader :currentPlayer, :currentMonster

    def initialize
      @currentPlayer = nil
      @currentMonster = nil
      @players = Array.new
			@dealer = CardDealer.instance
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
			init_players(players)
			set_enemies
			
			@dealer.init_cards
			next_turn
    end

    def next_turn
      stateOK = next_turn_allowed
      if (stateOK)
        @currentMonster = @dealer.next_monster
        @currentPlayer = next_player
        dead = @currentPlayer.dead
        
        if (dead)
          @currentPlayer.init_treasures
        end
      end
      stateOK
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
        i = 0
        while (!abort && i < array_players.size - 1)
          if (array_players.at(i) != array_enemies.at(i) and array_players.at(i+1) != array_enemies.at(i+1) and !finished)
            # Asignar al jugador players[1] el enemigo enemies[i] y sacarlos de los arrays
            @players.at(array_players.shift).set_enemy(@players.at(array_enemies.shift))
            i = i + 1
					else
            abort = true
            i = 0
          end
        end
				
				if !abort
					finished = true
				end
      end
			
			# Asignar el último enemigo
			@players.at(array_players.shift).set_enemy(@players.at(array_enemies.shift))
    end
  end
end
