# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "prize.rb"
require_relative "bad_consequence.rb"
require_relative 'numeric_bad_consequence.rb'
require_relative 'death_bad_consequence.rb'
require_relative 'specific_bad_consequence.rb'
require_relative "treasure.rb"
require_relative "monster.rb"
require_relative "treasure_kind.rb"
require_relative "combat_result.rb"
require_relative "dice.rb"

module Napakalaki
  class Player
    attr_reader :name, :dead, :hiddenTreasures, :visibleTreasures, :level

    @@MAXLEVEL = 10

    def initialize(name)
      @name = name
      @level = 0
      @dead = true
      @canISteal = true
      @visibleTreasures = Array.new
      @hiddenTreasures = Array.new
      @enemy = nil
      @pendingBadConsequence = nil
    end
		
		def self.MAXLEVEL
			@@MAXLEVEL
		end
    
    def get_enemy
      @enemy
    end
    protected :get_enemy

    def combat(m)
			combat_result = nil
      my_level = get_combat_level
      monster_level = m.combat_level
      combat_result = nil
      
      if (my_level > monster_level)
        apply_prize(m)
        
        if (@level >= @@MAXLEVEL)
          combat_result = CombatResult::WINGAME
        else
          combat_result = CombatResult::WIN
        end
        
      else
        apply_bad_consequence(m)
        combat_result = CombatResult::LOSE
      end
      combat_result
    end

    def make_treasure_visible(t)
      can_i = can_make_treasure_visible(t)
      
      if (can_i)
        @visibleTreasures.push(t)
        @hiddenTreasures.delete(t)
      end
    end

    def discard_visible_treasure(t)
			@visibleTreasures.delete(t)
			
			if @pendingBadConsequence != nil and !@pendingBadConsequence.is_empty
				@pendingBadConsequence.substract_visible_treasure(t)
			end
			
			die_if_no_treasures
    end

    def discard_hidden_treasure(t)
			@hiddenTreasures.delete(t)
			
			if @pendingBadConsequence != nil and !@pendingBadConsequence.is_empty
				@pendingBadConsequence.substract_hidden_treasure(t)
			end
			
			die_if_no_treasures
    end

    def valid_state
      @pendingBadConsequence.is_empty and @hiddenTreasures.size <= 4;
    end

    def init_treasures
      dealer = CardDealer.instance
      dice = Dice.instance
      bring_to_life
      
      treasure = dealer.next_treasure
      @hiddenTreasures.push(treasure)
      
      number = dice.next_number
      
      if (number > 1)
        treasure = dealer.next_treasure
        @hiddenTreasures.push(treasure)
      end
      
      if (number == 6)
        treasure = dealer.next_treasure
        @hiddenTreasures.push(treasure)
      end
    end

    def steal_treasure
			treasure = nil
			can_i = can_i_steal
			
			if (can_i)
				can_you = @enemy.send(:can_you_give_me_a_treasure)
				
				if (can_you)
					treasure = @enemy.send(:give_me_a_treasure)
					@hiddenTreasures.push(treasure)
					have_stolen
				end
			end
			
			treasure
    end
		
		def can_i_steal
			@canISteal
		end

    def set_enemy(enemy)
      @enemy = enemy
    end

    def discard_all_treasures
			visible = Array.new(@visibleTreasures);
			hidden = Array.new(@hiddenTreasures);
			
      visible.each { |treasure|
        discard_visible_treasure(treasure)
      }
      
      hidden.each { |treasure|
        discard_hidden_treasure(treasure)
      }
    end

    private
    def bring_to_life
      @dead = false
			@level = 1
    end

    def get_combat_level
      l = @level

      @visibleTreasures.each { |t|
        l += t.bonus
      }

      l
    end
    protected :get_combat_level
    
    def get_oponent_level(m)
      m.combat_level
    end
    protected :get_oponent_level
    
    def should_convert
      dice = Dice.instance
      dice.next_number == 1
    end
    protected :should_convert
    
    def increment_levels(l)
      @level += l

      if @level > @@MAXLEVEL then
        @level = @@MAXLEVEL
      end
    end

    def decrement_levels(l)
      @level -= l

      if @level < 1 then
        @level = 1
      end
    end

    def set_pending_bad_consequence(b)
      @pendingBadConsequence = b
    end

    def apply_prize(m)
      n_levels = m.get_levels_gained
      
      increment_levels(n_levels)
      
      n_treasures = m.get_treasures_gained
      
      if (n_treasures > 0)
        dealer = CardDealer.instance
        
        for i in 1..n_treasures
          treasure = dealer.next_treasure
          @hiddenTreasures.push(treasure)
        end
      end
    end

    def apply_bad_consequence(m)
      bad_consequence = m.bad_consequence
      n_levels = bad_consequence.levels
      decrement_levels(n_levels)
      pending_bad = bad_consequence.adjust_to_fit_treasure_lists(@visibleTreasures, @hiddenTreasures)
      set_pending_bad_consequence(pending_bad)
    end

    def can_make_treasure_visible(t)
			allowed = true
			onehands = 0
			
			if (t.type == TreasureKind::BOTHHANDS)
				@visibleTreasures.each { |treasure| 
					if (treasure.type == TreasureKind::BOTHHANDS or treasure.type == TreasureKind::ONEHAND)
						allowed = false
					end
				}
			elsif (t.type == TreasureKind::ONEHAND)
				@visibleTreasures.each { |treasure| 
					if (treasure.type == TreasureKind::ONEHAND)
						onehands += 1
					end
					if (treasure.type == TreasureKind::BOTHHANDS or onehands >= 2)
						allowed = false
					end
				}
			else
				@visibleTreasures.each { |treasure| 
					if (treasure.type == t.type)
						allowed = false
					end
				}
			end
			
			allowed
    end

    def how_many_visible_treasures(tKind)
      treasure_number = 0

      @visibleTreasures.each { |t|
        if t.type == tKind then
          treasure_number = treasure_number+1
        end
      }

      treasure_number
    end

    def die_if_no_treasures
      if (@visibleTreasures.empty? and @hiddenTreasures.empty?) then
        @dead = true
      end
    end

    def give_me_a_treasure
			@hiddenTreasures.at(rand(@hiddenTreasures.size))
    end

    def can_you_give_me_a_treasure
      not @hiddenTreasures.empty?
    end

    def have_stolen
      @canISteal = false
    end
    
    public
    def to_s
      "#{@name}, Nivel: #{@level}"
    end
  end
end
