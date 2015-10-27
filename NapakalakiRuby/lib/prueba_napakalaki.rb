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

# Los hondos
bc_hondos = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto.")
p_hondos = Prize.new(2, 1)
hondos = Monster.new("Los hondos", 8, bc_hondos, p_hondos)
monsters.push(hondos)

# Chibithulhu
bc_chibi = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible.",
           0, TreasureKind::HELMET, nil)
p_chibi = Prize.new(1, 1)
chibi = Monster.new("Chibithulhu", 2, bc_chibi, p_chibi)
monsters.push(chibi)

# El sopor de Dunwich
bc_dunwich = BadConsequence.newLevelSpecificTreasures("El primordial bostezo contagioso. Pierdes tu calzado visible.", 
             0, TreasureKind::SHOES, nil)
p_dunwich = Prize.new(1, 1)
dunwich = Monster.new("El sopor de Dunwich", 2, bc_dunwich, p_dunwich)
monsters.push(dunwich)

# Ángeles de la noche ibicenca
bc_angeles = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Pierdes una mano visible y otra oculta", 
             0, TreasureKind::ONEHAND, TreasureKind::ONEHAND)
p_angeles = Prize.new(4, 1)
angeles = Monster.new("Angeles de la noche ibicenca", 14, bc_angeles, p_angeles)
monsters.push(angeles)

# El gorrón en el umbral
bc_gorron = BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles.", 
            0, 5, 0)
p_gorron = Prize.new(3, 1)
gorron = Monster.new("El gorron en el umbral", 10, bc_gorron, p_gorron)
monsters.push(gorron)

# H.P. Munchcraft
bc_munchcraft = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible", 
                0, TreasureKind::ARMOR, nil)
p_munchcraft = Prize.new(2, 1)
munchcraft = Monster.new("H.P. Munchcraft", 6, bc_munchcraft, p_munchcraft)
monsters.push(munchcraft)

# Bichgooth
bc_bichgooth = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible.", 
               0, TreasureKind::ARMOR, nil)
p_bichgooth = Prize.new(1, 1)
bichgooth = Monster.new("Bichgooth", 2, bc_bichgooth, p_bichgooth)
monsters.push(bichgooth)

# El rey de rosa
bc_reyrosa = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles.", 
             5, 3, 0)
p_reyrosa = Prize.new(4, 2)
reyrosa = Monster.new("El rey de rosa", 13, bc_reyrosa, p_reyrosa)
monsters.push(reyrosa)

# La que redacta en las tinieblas
bc_tinieblas = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles.", 
               2, 0, 0)
p_tinieblas = Prize.new(1, 1)
tinieblas = Monster.new("La que redacta en las tinieblas", 2, bc_tinieblas, p_tinieblas)
monsters.push(tinieblas)