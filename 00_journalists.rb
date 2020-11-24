require 'yaml'
# Import de la base de donnée de HASH
data = YAML.load_file '00_dbjourna.txt'
data.sort_by{|hash|}



#------------------Méthode Combien de handle------------1-

def handle_count(array)

counter = array.length
puts "Nombre d'array dans la database: " + counter.to_s
return counter
end

#------------------Méthode du handle le plus petit et  mtd du hanlde le  + grand-------2-

def short_handle(array)

array.min_by(&:length)

end

#####------####3#

def max_handle_size(array)

max_hs = array.max_by(&:length).length


return max_hs 

end

#------------------Méthode du 5 char handle sans compter le @ (on enlève 1 a la longueur)-------4-

def five_handle(array)

count = 0

array.each do |item|

	if item.length ==  5 + 1 # car sinon il compte le @
  	count += 1
	else
  	count = count
	end
	end
	return count 
end

#------------------Méthode des handle avec majuscules après le @-------5-

def upcase_handle(array)

count = 0

array.each do |item|
	
		if item[1..1] =~ /[A-Z]/ # verifie si la lettre en position 1 est en majuscule, car le @ est en 0
		count = count + 1  
		end
end
	return count
end


#------------------Méthode tri de hanlde par ordre alphabetique-----------6-
 
def alpha_sort(array)

alpha_array = array.sort  #fonction qui trie l'array alphabetiquement automatiquement
print alpha_array.inspect
puts

return alpha_array

end

#------------------Méthode tri de hanlde par taille-----------7-

def size_sort(array)

sized_array = array.sort_by {|x| x.length} 
print sized_array.inspect
puts
return sized_array

end
#------------------Méthode trouver l'index d'un handle-----------8-

def find_index(array)

handle = gets.chomp.to_s

handle_index = array.index(handle)

	if handle_index != nil # protection contre une entrée invalide

		puts "L'index de " + handle + " est " + handle_index.to_s

	else puts "Ce handle n'existe pas dans la base de données"
	exit 
	end
end 


#------------------Méthode répartition des handle par taille-----------9-


def handle_count_by_size(array)

cur_size= 0                                                                                                                 # taille du handle au départ, on commence a 0
maxsize= max_handle_size(array)                                                                                             # on recupère la taille du plus gros handle

while cur_size <= maxsize 													 # limites de la boucle = maxsize
	
	counter = array.count{|x| x.size == cur_size}
	if counter > 0														 # si le compteur > 0, nous avons au moins une entrée pour la taille de handle courante, on peut donc l'afficher, sinon rien ne se passe.
		puts "Les handles (sans @) de " + (cur_size - 1).to_s + " caratères repésentent " + counter.to_s + " entrées"
	end 
	cur_size  += 1
	
end
return counter
end


# ------------------- MENU ----------------------

def menu(array)
puts "Que voulez vous faire?
      1: Combien y a-t-il de handle dans cette array ?
      2: Quel est le handle le plus court de cette liste ?
      3: Quel est la taille du handle le plus long ?
      4: Combien y-a-t'il de handle contenant 5 caractères (le @ ne compte pas pour un caractère)
      5: Combien commencent par une majuscule (première lettre juste après le @) ?
      6: Trie la liste de handle par ordre alphabétique.
      7: Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)
      8: Quelle est la position dans l'array d'une personne ?
      9: Répartition des handle par taille de ces derniers "
print ">"      
entry = gets.chomp.to_i     
 
until entry >= 1 && entry <= 9 
puts "Erreur de saisi, merci de recommencer"
puts "Que voulez vous faire?
      1: Combien y a-t-il de handle dans cette array ?
      2: Quel est le handle le plus court de cette liste ?
      3: Quel est la taille du handle le plus long ?
      4: Combien y-a-t'il de handle contenant 5 caractères (le @ ne compte pas pour un caractère)
      5: Combien commencent par une majuscule (première lettre juste après le @) ?
      6: Trie la liste de handle par ordre alphabétique.
      7: Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après)
      8: Quelle est la position dans l'array d'une personne ?
      9: Répartition des handle par taille de ces derniers "
print ">"      
entry = gets.chomp.to_i   
end

case entry
	when 1
		handle_count(array)
	when 2
		puts "Le handle le plus petit est " +short_handle(array)
	when 3
		puts "La taille du plus grand handle (sans @) est " + (max_handle_size(array) - 1).to_s
	when 4
		puts "Il y a " + five_handle(array).to_s + " handles avec 5 caratères (sans @)"
	when 5
		puts "Il y a " + upcase_handle(array).to_s + " handles avec majuscule au début"
	when 6
		alpha_sort(array)
	when 7
		size_sort(array)
	when 8
		puts "Quel est le handle de l'index a trouver ?"
		find_index(array)
	when 9
		handle_count_by_size(array)
	else 
	puts "Erreur de saisi, merci de recommencer"
	exit
	end 
end


#------------------------------------ Lancement du programme -----------------------------------------------


menu(data)


