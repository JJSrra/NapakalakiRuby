# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "prize.rb"
require_relative "bad_consequence"
require_relative "monster.rb"
require_relative "treasure_kind.rb"

monsters = Array.new

# Bicéfalo
p_bicefalo = Prize.new(1, 1)
bc_bicefalo = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 
              3, [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS], nil)
bicefalo = Monster.new("Bicefalo", 20, bc_bicefalo, p_bicefalo)
monsters.push(bicefalo)

# 3 Byakhees de bonanza
p_byakhees = Prize.new(2, 1)
bc_byakhees = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta.", 
              0, TreasureKind::ARMOR, TreasureKind::ARMOR)
byakhees = Monster.new("3 Byakhees de bonanza", 8, bc_byakhees, p_byakhees)
monsters.push(byakhees)