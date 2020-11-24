require 'yaml'

# -------Import de la base de donnée des noms de cryptoss + organisation-------- 
crypto_name = YAML.load_file '01_dbcrypto1.txt'
#crypto_name.sort_by{|hash|}

# -------Import de la base de donnée des valeurs de cryptos-------
crypto_value = YAML.load_file '01_dbcrypto2.txt'

# ------- Combination des bases -------

comb = Hash[crypto_value.map(&:to_f).zip(crypto_name)]
#comb.map(&:to_i)


#------------Methode "La ou les crypto qui ont la plus grosse valeur" -----------------1-

def max_cryptoval(array)

puts
	puts "Chosis le nombre du TOP de crypto que tu veux voir (TOP 1, 5, 10..)"
	value = gets.chomp.to_i
	print ">"
	max_cv = array.max(value)


		return max_cv

end



#-----------Methode "La ou les crypto qui ont la plus petite valeur" ------------------------------2-


def min_cryptoval(array)
	puts " "
	puts "Chosis le nombre du TOP de cryptos dont la valeur est la plus basse que tu veux voir (TOP 1, 5, 10..)"
	value = gets.chomp.to_i
	
	puts " "
	puts "Voici la liste du TOP " + value.to_s + " des valeurs les plus petites"
	min_cv = (array.min (value))



		return min_cv

end



# -----------Les devises dont le cours est inférieur à 6000 -------------------------------3-
def six_cryptoval(array)
	puts " "
	puts "Voici la selection de devises dont la valeur est inférieur à 6000"
	puts "                               |"
	puts "                               v"
	below_six_t = array.select {|num| num <= 6000 }



		return below_six_t

end




#------------La devise la plus chère parmi celles dont le cours est inférieur à 6000.------4-

def best6_cryptoval(array)

	puts
	puts "Chosis le nombre du TOP de cryptos dont la valeur est inférieurs à 6000 que tu veux voir (TOP 1, 5, 10..)"
	print ">"
	value = gets.chomp.to_i
	
	puts""
	puts "Voici la liste du TOP " + value.to_s + " des valeurs les plus élevés (<6000)"
		max = 6000
		selected_array = array.select {|num| num <= max }
		top_below_six_t = selected_array.max(value)


		return top_below_six_t

end






# ------------------- MENU ----------------------

def menu(array)
puts "Que voulez vous faire?
      1: La ou les crypto qui ont la plus grosse valeur ?
      2: La ou les crypto qui ont la plus petite valeur ?
      3: Les ou les cryptodont le cours est inférieur à 6000 ?
      4: La ou les crypto la plus chère parmi celles dont le cours est inférieur à 6000 ?"

print ">"      
entry = gets.chomp.to_i     
 
until entry >= 1 && entry <= 4 
puts "Erreur de saisi, merci de recommencer"
puts "Que voulez vous faire?
      1: La ou les crypto qui ont la plus grosse valeur ?
      2: La ou les crypto qui ont la plus petite valeur ?
      3: Les ou les cryptodont le cours est inférieur à 6000 ?
      4: La ou les crypto la plus chère parmi celles dont le cours est inférieur à 6000 ?"

print ">"      
entry = gets.chomp.to_i   
end

case entry
	when 1
		puts max_cryptoval(array)
	when 2
		puts min_cryptoval(array)
	when 3
		puts six_cryptoval(array)
	when 4
		puts best6_cryptoval(array)

	else 
	puts "Erreur de saisi, merci de recommencer"
	exit
	end 
end

# ------------------- LANCEMENT DU PROGRAMME - MENU ----------------------

menu(comb)
