# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Napakalaki
  class CultistPlayer < Player
    
    @@totalCultistPlayers = 0
    
    def initialize(p,c)
      @name = p.name
      @level = p.level
      @dead = p.dead
      @canISteal = p.canISteal
      @visibleTreasures = p.visibleTreasures
      @hiddenTreasures = p.hiddenTreasures
      @enemy = p.get_enemy
      @pendingBadConsequence = p.pendingBadConsequence
      @myCultistCard = c
    end
    
    def self.get_total_cultist_players
      @@totalCultistPlayers
    end
    
    def get_combat_level
      super.get_combat_level * 1.20 + @myCultistCard.gained_levels * @@totalCultistPlayers
    end
    protected :get_combat_level
    
    def get_oponent_level(m)
      m.get_combat_level_against_cultist_player
    end
    protected :get_oponent_level

    def should_convert
      false
    end
    protected :should_convert
    
    def give_me_a_treasure
      @visibleTreasures.at(rand(@visibleTreasures.size))
    end
    
    def can_you_give_me_a_treasure
      not @visibleTreasures.empty?
    end
    
  end
end
