# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "prize.rb"
require_relative "bad_consequence"
require_relative "treasure.rb"
require_relative "monster.rb"
require_relative "treasure_kind.rb"
require_relative "combat_result.rb"

class Player
	attr_reader :name, :dead, :hiddenTreasures, :visibleTreasures, :level
	
	@@MAXLEVEL = 10
	
  def initialize(name)
		@name = name
		@level = 0
		@dead = false
		@canISteal = true
		@visibleTreasures = array.new
		@hiddenTreasures = array.new
		@enemy = nil
		@pendingBadConsequence = BadConsequence.newLevelNumberOfTreasures("", 0, 0, 0)
  end
	
	def combat
		
	end
	
	def make_treasure_visible
		
	end
	
	def discard_visible_treasure
		
	end
	
	def discard_hidden_treasure
		
	end
	
	def valid_state
		@pendingBadConsequence.isEmpty and @hiddenTreasures.size <= 4;
	end
	
	def initTreasures
		
	end
	
	def steal_treasure
		
	end
	
	def set_enemy(enemy)
		@enemy = enemy
	end
	
	def discard_all_treasures
		
	end
	
	private
	def bring_to_life
		@dead = true
	end
	
	def get_combat_level
		l = @level
		
		@visibleTreasures.each { |t|
			l += t.bonus
		}
		
		l
	end
	
	def increment_levels(l)
		@level += l
		
		if @level > @@MAXLEVEL then
			@level = @@MAXLEVEL
		end
	end
	
	def decrement_levels(l)
		@level -= l
		
		if @level < 0 then
			@level = 0
		end
	end
	
	def set_pending_bad_consequence(b)
		@pendingBadConsequence = b
	end
	
	def apply_prize(m)
		
	end
	
	def apply_bad_consequence(m)
		
	end
	
	def can_make_treasure_visible(t)
		
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
		
	end
	
	def can_you_give_me_a_treasure
		not @hiddenTreasures.empty?
	end
	
	def have_stolen
		@canISteal = false
	end
end
