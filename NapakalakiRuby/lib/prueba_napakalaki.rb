# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "prize.rb"
require_relative "bad_consequence"
require_relative "monster.rb"
require_relative "treasure_kind.rb"

monsters = Array.new

premio = Prize.new(1031, 7)
mal_rollo1 = BadConsequence.newDeath("Se conecta. Estas muerto.")
halconHodgson = Monster.new("Halcon cuco del Sr. Hodgson", 1031, mal_rollo1, premio)

premio2 = Prize.new(0, 0)
mal_rollo2 = BadConsequence.newLevelNumberOfTreasures("Eeeeeehhhhhh... Pierdes muchas horas de clase.", 9, 5, 4)
sevilla = Monster.new("Sevilla", 9001, mal_rollo2, premio2)

premio3 = Prize.new("a-bx=m", "\n\t(10)\n\t(2 )")
mal_rollo3 = BadConsequence.newLevelSpecificTreasures("Te asusta, pero de buen rollo. Pierdes la cabeza.", 0, [TreasureKind::HELMET], nil)
alem = Monster.new("Algebra lineal y estructuras matematicas", 19, mal_rollo3, premio3)

monsters.push(halconHodgson)

puts monsters[0]
#puts halconHodgson
#puts "\n"
#puts sevilla
#puts "\n"
#puts alem