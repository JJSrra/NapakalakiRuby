# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "prize.rb"
require_relative "bad_consequence"
require_relative "monster.rb"
require_relative "treasure_kind.rb"

monsters = Array.new

# Los hondos
bc_hondos = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto.")
p_hondos = Prize.new(2, 1)
los_hondos = Monster.new("Los hondos", 8, bc_hondos, p_hondos)
monsters.push(los_hondos)