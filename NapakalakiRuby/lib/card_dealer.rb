#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'
require_relative 'prize.rb'
require_relative 'treasure.rb'
require_relative 'monster.rb'
require_relative 'treasure_kind.rb'
require_relative 'bad_consequence.rb'

module Napakalaki
	class CardDealer
		attr_reader :unused_monsters, :unused_treasures, :used_monsters, :used_treasures, :unused_cultists

		include Singleton
		def initialize
			@unused_monsters = Array.new
			@unused_treasures = Array.new
			@used_monsters = Array.new
			@used_treasures = Array.new
      @unused_cultists = Array.new
		end

		def init_treasure_card_deck
			# Sí mi amo
			si_mi_amo = Treasure.new("Si mi amo!", 4, TreasureKind::HELMET)
			@unused_treasures.push(si_mi_amo)

			# Botas de investigación
			botas_investigacion = Treasure.new("Botas de investigacion", 3, TreasureKind::SHOES)
			@unused_treasures.push(botas_investigacion)

			# Capucha de Cthulhu
			capucha_cthulhu = Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)
			@unused_treasures.push(capucha_cthulhu)

			# A prueba de babas
			prueba_babas = Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)
			@unused_treasures.push(prueba_babas)

			# Botas de lluvia ácida
			botas_acido = Treasure.new("Botas de lluvia acida", 1, TreasureKind::BOTHHANDS)
			@unused_treasures.push(botas_acido)

			# Casco minero
			casco_minero = Treasure.new("Casco minero", 2, TreasureKind::HELMET)
			@unused_treasures.push(casco_minero)

			# Ametralladora Thompson
			thompson = Treasure.new("Ametralladora Thompson", 4, TreasureKind::BOTHHANDS)
			@unused_treasures.push(thompson)

			# Camiseta de la UGR
			ugr = Treasure.new("Camiseta de la UGR", 1, TreasureKind::ARMOR)
			@unused_treasures.push(ugr)

			# Clavo de rail ferroviario
			clavo_rail = Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)
			@unused_treasures.push(clavo_rail)

			# Cuchillo de sushi arcano
			cuchillo_sushi = Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
			@unused_treasures.push(cuchillo_sushi)

			# Fez alópodo
			fez_alopodo = Treasure.new("Fez alopodo", 3, TreasureKind::HELMET)
			@unused_treasures.push(fez_alopodo)

			# Hacha prehistórica
			hacha_prehistorica = Treasure.new("Hacha prehistorica", 2, TreasureKind::ONEHAND)
			@unused_treasures.push(hacha_prehistorica)

			# El aparato del Pr. Tesla
			aparato_tesla = Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)
			@unused_treasures.push(aparato_tesla)

			# Gaita
			gaita = Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)
			@unused_treasures.push(gaita)

			# Insecticida
			insecticida = Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
			@unused_treasures.push(insecticida)

			# Escopeta de 3 cañones
			escopeta_3 = Treasure.new("Escopeta de 3 cañones", 4, TreasureKind::BOTHHANDS)
			@unused_treasures.push(escopeta_3)

			# Garabato místico
			garabato = Treasure.new("Garabato mistico", 2, TreasureKind::ONEHAND)
			@unused_treasures.push(garabato)

			# La rebeca metálica
			rebeca = Treasure.new("La rebeca metalica", 2, TreasureKind::ARMOR)
			@unused_treasures.push(rebeca)

			# Lanzallamas
			lanzallamas = Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)
			@unused_treasures.push(lanzallamas)

			# Necrocomicón
			necrocomicon = Treasure.new("Necrocomicon", 1, TreasureKind::ONEHAND)
			@unused_treasures.push(necrocomicon)

			# Necronomicón
			necronomicon = Treasure.new("Necronomicon", 5, TreasureKind::BOTHHANDS)
			@unused_treasures.push(necronomicon)

			# Linterna dos manos
			linterna_dos_manos = Treasure.new("Linterna a dos manos", 3, TreasureKind::BOTHHANDS)
			@unused_treasures.push(linterna_dos_manos)

			# Necrognomicón
			necrognomicon = Treasure.new("Necrognomicon", 2, TreasureKind::ONEHAND)
			@unused_treasures.push(necrognomicon)

			# Necrotelecom
			necrotelecom = Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)
			@unused_treasures.push(necrotelecom)

			# Mazo de los antiguos
			mazo_antiguos = Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)
			@unused_treasures.push(mazo_antiguos)

			# Necroplayboycón
			necroplayboycon = Treasure.new("Necroplayboycon", 3, TreasureKind::ONEHAND)
			@unused_treasures.push(necroplayboycon)

			# Porra preternatural
			porra_preternatural = Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)
			@unused_treasures.push(porra_preternatural)

			# Shogulador
			shogulador = Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)
			@unused_treasures.push(shogulador)

			# Varita de atizamiento
			varita_atizamiento = Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
			@unused_treasures.push(varita_atizamiento)

			# Tentáculo de pega
			tentaculo = Treasure.new("Tentaculo de pega", 2, TreasureKind::HELMET)
			@unused_treasures.push(tentaculo)

			# Zapato deja-amigos
			zapato_deja_amigos = Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES)
			@unused_treasures.push(zapato_deja_amigos)
      
      shuffle_treasures
		end

		def init_monster_card_deck
			# Bicéfalo
			p_bicefalo = Prize.new(1, 1)
			bc_bicefalo = SpecificBadConsequence.new("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 
				3, [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS], [])
			bicefalo = Monster.new_normal_monster("Bicefalo", 20, bc_bicefalo, p_bicefalo)
			@unused_monsters.push(bicefalo)

			# 3 Byakhees de bonanza
			p_byakhees = Prize.new(2, 1)
			bc_byakhees = SpecificBadConsequence.new("Pierdes tu armadura visible y otra oculta.", 
				0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
			byakhees = Monster.new_normal_monster("3 Byakhees de bonanza", 8, bc_byakhees, p_byakhees)
			@unused_monsters.push(byakhees)

			# Los hondos
			bc_hondos = DeathBadConsequence.new("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto.")
			p_hondos = Prize.new(2, 1)
			hondos = Monster.new_normal_monster("Los hondos", 8, bc_hondos, p_hondos)
			@unused_monsters.push(hondos)

			# Chibithulhu
			bc_chibi = SpecificBadConsequence.new("Embobados con el lindo primigenio te descartas de tu casco visible.",
				0, [TreasureKind::HELMET], [])
			p_chibi = Prize.new(1, 1)
			chibi = Monster.new_normal_monster("Chibithulhu", 2, bc_chibi, p_chibi)
			@unused_monsters.push(chibi)

			# El sopor de Dunwich
			bc_dunwich = SpecificBadConsequence.new("El primordial bostezo contagioso. Pierdes tu calzado visible.", 
				0, [TreasureKind::SHOES], [])
			p_dunwich = Prize.new(1, 1)
			dunwich = Monster.new_normal_monster("El sopor de Dunwich", 2, bc_dunwich, p_dunwich)
			@unused_monsters.push(dunwich)

			# Ángeles de la noche ibicenca
			bc_angeles = SpecificBadConsequence.new("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Pierdes una mano visible y otra oculta.", 
				0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
			p_angeles = Prize.new(4, 1)
			angeles = Monster.new_normal_monster("Angeles de la noche ibicenca", 14, bc_angeles, p_angeles)
			@unused_monsters.push(angeles)

			# El gorrón en el umbral
			bc_gorron = NumericBadConsequence.new("Pierdes todos tus tesoros visibles.", 
				0, BadConsequence.MAXTREASURES, 0)
			p_gorron = Prize.new(3, 1)
			gorron = Monster.new_normal_monster("El gorron en el umbral", 10, bc_gorron, p_gorron)
			@unused_monsters.push(gorron)

			# H.P. Munchcraft
			bc_munchcraft = SpecificBadConsequence.new("Pierdes la armadura visible.", 
				0, [TreasureKind::ARMOR], [])
			p_munchcraft = Prize.new(2, 1)
			munchcraft = Monster.new_normal_monster("H.P. Munchcraft", 6, bc_munchcraft, p_munchcraft)
			@unused_monsters.push(munchcraft)

			# Bichgooth
			bc_bichgooth = SpecificBadConsequence.new("Sientes bichos bajo la ropa. Descarta la armadura visible.", 
				0, [TreasureKind::ARMOR], [])
			p_bichgooth = Prize.new(1, 1)
			bichgooth = Monster.new_normal_monster("Bichgooth", 2, bc_bichgooth, p_bichgooth)
			@unused_monsters.push(bichgooth)

			# El rey de rosa
			bc_reyrosa = NumericBadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles.", 
				5, 3, 0)
			p_reyrosa = Prize.new(4, 2)
			reyrosa = Monster.new_normal_monster("El rey de rosa", 13, bc_reyrosa, p_reyrosa)
			@unused_monsters.push(reyrosa)

			# La que redacta en las tinieblas
			bc_tinieblas = NumericBadConsequence.new("Toses los pulmones y pierdes 2 niveles.", 
				2, 0, 0)
			p_tinieblas = Prize.new(1, 1)
			tinieblas = Monster.new_normal_monster("La que redacta en las tinieblas", 2, bc_tinieblas, p_tinieblas)
			@unused_monsters.push(tinieblas)

			# Semillas Cthulhu
			bc_semillas = NumericBadConsequence.new("Pierdes 2 niveles y 2 tesoros ocultos.",
				2, 0, 2)
			p_semillas = Prize.new(2, 1)
			semillas_cthulhu = Monster.new_normal_monster("Semillas Cthulhu", 4, bc_semillas, p_semillas)
			@unused_monsters.push(semillas_cthulhu)

			# Dameargo
			bc_dameargo = SpecificBadConsequence.new("Te intentas escaquear. Pierdes una mano visible.",
				0, [TreasureKind::ONEHAND], [])
			p_dameargo = Prize.new(2, 1)
			dameargo = Monster.new_normal_monster("Dameargo", 1, bc_dameargo, p_dameargo)
			@unused_monsters.push(dameargo)

			# Pollipólipo volante
			bc_pollipolipo = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
			p_pollipolipo = Prize.new(1, 1)
			pollipolipo = Monster.new_normal_monster("Pollipolipo volante", 3, bc_pollipolipo, p_pollipolipo)
			@unused_monsters.push(pollipolipo)

			# Yskhtihyssggoth
			bc_impronunciable = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estas muerto.")
			p_impronunciable = Prize.new(3, 1)
			impronunciable = Monster.new_normal_monster("Yskhtihyssggoth", 12, bc_impronunciable, p_impronunciable)
			@unused_monsters.push(impronunciable)

			# Familia felíz
			bc_familia = BadConsequence.newDeath("La familia te atrapa. Estas muerto.")
			p_familia = Prize.new(4, 1)
			familia = Monster.new_normal_monster("Familia feliz", 1, bc_familia, p_familia)
			@unused_monsters.push(familia)

			# Roboggoth
			bc_roboggoth = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y 1 tesoro de dos manos visible.",
				2, [TreasureKind::BOTHHANDS], [])
			p_roboggoth = Prize.new(2, 1)
			roboggoth = Monster.new_normal_monster("Roboggoth", 8, bc_roboggoth, p_roboggoth)
			@unused_monsters.push(roboggoth)

			# El espia
			bc_espia = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible.", 0, [TreasureKind::HELMET], [])
			p_espia = Prize.new(1, 1)
			espia = Monster.new_normal_monster("El espia", 5, bc_espia, p_espia)
			@unused_monsters.push(espia)

			# El lenguas
			bc_lenguas = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
			p_lenguas = Prize.new(1, 1)
			lenguas = Monster.new_normal_monster("El lenguas", 20, bc_lenguas, p_lenguas)
			@unused_monsters.push(lenguas)
      
      # El mal indecible impronunciable
      bc_indecible = BadConsequence.newLevelSpecificTreasures("Pierdes 1 mano visible.", 0, [TreasureKind::ONEHAND], [])
      p_indecible = Prize.new(3, 1)
      indecible = Monster.new_cultist_monster("El mal indecible impronunciable", 10, bc_indecible, p_indecible, -2)
      @unused_monsters.push(indecible)
      
      # Testigos oculares
      bc_testigos = BadConsequence.newLevelNumberOfTreasures("Pierdes tus tesoros visibles. Jajaja.", 0, BadConsequence.MAXTREASURES, 0)
      p_testigos = Prize.new(2, 1)
      testigos = Monster.new_cultist_monster("Testigos oculares", 6, bc_testigos, p_testigos, 2)
      @unused_monsters.push(testigos)
      
      # El gran Cthulhu
      bc_gran_cthulhu = BadConsequence.newDeath("Hoy no es tu dia de suerte. Mueres.")
      p_gran_cthulhu = Prize.new(2, 5)
      gran_cthulhu = Monster.new_cultist_monster("El gran Cthulhu", 20, bc_gran_cthulhu, p_gran_cthulhu, 4)
      @unused_monsters.push(gran_cthulhu)
      
      # Serpiente político
      bc_politico = BadConsequence.newLevelNumberOfTreasures("Tu gobierno te recorta 2 niveles", 2, 0, 0)
      p_politico = Prize.new(2, 1)
      politico = Monster.new_cultist_monster("Serpiente politico", 8, bc_politico, p_politico, -2)
      @unused_monsters.push(politico)
      
      # Felpuggoth
      bc_felpuggoth = BadConsequence.newLevelSpecificTreasures("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas.", 
        0, [TreasureKind::HELMET, TreasureKind::ARMOR],
        [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::ONEHAND,
         TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS, TreasureKind::BOTHHANDS])
      p_felpuggoth = Prize.new(1, 1)
      felpuggoth = Monster.new_cultist_monster("Felpuggoth", 2, bc_felpuggoth, p_felpuggoth, 5)
      @unused_monsters.push(felpuggoth)
      
      # Shoggoth
      bc_shoggoth = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles.", 2, 0, 0)
      p_shoggoth = Prize.new(4, 2)
      shoggoth = Monster.new_cultist_monster("Shoggoth", 16, bc_shoggoth, p_shoggoth, -4)
      @unused_monsters.push(shoggoth)
      
      # Lolitagooth
      bc_lolita = BadConsequence.newLevelNumberOfTreasures("Pintalabios negro. Pierdes 2 niveles.", 2, 0, 0)
      p_lolita = Prize.new(1, 1)
      lolita = Monster.new_cultist_monster("Lolitagooth", 2, bc_lolita, p_lolita, 3)
      @unused_monsters.push(lolita)
      
      shuffle_monsters
		end
    
    def init_cultist_card_deck
      @unused_cultists.push(new Cultist("Sectario", 1))
      @unused_cultists.push(new Cultist("Sectario", 2))
      @unused_cultists.push(new Cultist("Sectario", 1))
      @unused_cultists.push(new Cultist("Sectario", 2))
      @unused_cultists.push(new Cultist("Sectario", 1))
      @unused_cultists.push(new Cultist("Sectario", 1))
      
      shuffle_cultists
    end

		def shuffle_treasures
			@unused_treasures.shuffle!
		end

		def shuffle_monsters
			@unused_monsters.shuffle!
		end
    
    def shuffle_cultists
      @unused_cultists.shuffle!
    end

		def next_treasure
      if (@unused_treasures.empty?)
				@unused_treasures.concat(@used_treasures)
				@used_treasures.clear
				
        shuffle_treasures
      end
      
      @unused_treasures.shift
		end

		def next_monster
      if (@unused_monsters.empty?)
				@unused_monsters.concat(@used_monsters)
				@used_monsters.clear
				
        shuffle_treasures
      end
      
      siguiente = @unused_monsters.shift
			@used_monsters.push(siguiente)
			
			siguiente
		end
    
    def next_cultist      
      @unused_cultists.shift
    end

		def give_treasure_back(t)
			@used_treasures.push(t)
		end

		def give_monster_back(m)
			@used_monsters.push(m)
		end

		def init_cards
			init_treasure_card_deck
			init_monster_card_deck
      init_cultist_card_deck
		end
	end
end