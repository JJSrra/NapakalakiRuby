#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "prize.rb"
require_relative "bad_consequence"
require_relative "monster.rb"
require_relative "treasure_kind.rb"

# Lista de monstruos
monsters = Array.new

# Bicéfalo
p_bicefalo = Prize.new(1, 1)
bc_bicefalo = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 
              3, [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS], [])
bicefalo = Monster.new("Bicefalo", 20, bc_bicefalo, p_bicefalo)
monsters.push(bicefalo)

# 3 Byakhees de bonanza
p_byakhees = Prize.new(2, 1)
bc_byakhees = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible y otra oculta.", 
              0, TreasureKind::ARMOR, TreasureKind::ARMOR)
byakhees = Monster.new("3 Byakhees de bonanza", 8, bc_byakhees, p_byakhees)
monsters.push(byakhees)

# Los hondos
bc_hondos = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto.")
p_hondos = Prize.new(2, 1)
hondos = Monster.new("Los hondos", 8, bc_hondos, p_hondos)
monsters.push(hondos)

# Chibithulhu
bc_chibi = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible.",
           0, TreasureKind::HELMET, [])
p_chibi = Prize.new(1, 1)
chibi = Monster.new("Chibithulhu", 2, bc_chibi, p_chibi)
monsters.push(chibi)

# El sopor de Dunwich
bc_dunwich = BadConsequence.newLevelSpecificTreasures("El primordial bostezo contagioso. Pierdes tu calzado visible.", 
             0, TreasureKind::SHOES, [])
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
                0, TreasureKind::ARMOR, [])
p_munchcraft = Prize.new(2, 1)
munchcraft = Monster.new("H.P. Munchcraft", 6, bc_munchcraft, p_munchcraft)
monsters.push(munchcraft)

# Bichgooth
bc_bichgooth = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible.", 
               0, TreasureKind::ARMOR, [])
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

# Semillas Cthulhu
bc_semillas = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos.",
							2, 0, 2)
p_semillas = Prize.new(2, 1)
semillas_cthulhu = Monster.new("Semillas Cthulhu", 4, bc_semillas, p_semillas)
monsters.push(semillas_cthulhu)

# Dameargo
bc_dameargo = BadConsequence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible.",
							0, [TreasureKind::ONEHAND], [])
p_dameargo = Prize.new(2, 1)
dameargo = Monster.new("Dameargo", 1, bc_dameargo, p_dameargo)
monsters.push(dameargo)

# Pollipólipo volante
bc_pollipolipo = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
p_pollipolipo = Prize.new(1, 1)
pollipolipo = Monster.new("Pollipolipo volante", 3, bc_pollipolipo, p_pollipolipo)
monsters.push(pollipolipo)

# Yskhtihyssggoth
bc_impronunciable = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto.")
p_impronunciable = Prize.new(3, 1)
impronunciable = Monster.new("Yskhtihyssggoth", 12, bc_impronunciable, p_impronunciable)
monsters.push(impronunciable)

# Familia felíz
bc_familia = BadConsequence.newDeath("La familia te atrapa. Estas muerto.")
p_familia = Prize.new(4, 1)
familia = Monster.new("Familia feliz", 1, bc_familia, p_familia)
monsters.push(familia)

# Roboggoth
bc_roboggoth = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y 1 tesoro de dos manos visible.",
							 2, [TreasureKind::BOTHHANDS], [])
p_roboggoth = Prize.new(2, 1)
roboggoth = Monster.new("Roboggoth", 8, bc_roboggoth, p_roboggoth)
monsters.push(roboggoth)

# El espia
bc_espia = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 0, [TreasureKind::HELMET], [])
p_espia = Prize.new(1, 1)
espia = Monster.new("El espia", 5, bc_espia, p_espia)
monsters.push(espia)

# El lenguas
bc_lenguas = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
p_lenguas = Prize.new(1, 1)
lenguas = Monster.new("El lenguas", 20, bc_lenguas, p_lenguas)
monsters.push(lenguas)


#-------------------------------

# Monstrar monstruos con nivel superior a 10
puts "Monstruos con nivel de combate superior a 10:\n"
monsters.each { |monster|
	if monster.level > 10 then
		puts monster
		puts "\n"
	end
}
