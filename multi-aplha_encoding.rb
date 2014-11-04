class Encrypt
	def encrypt(string)
		#arrays with lettes stored		
		alphabet    = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'] 

		array_one   = ['z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a']
		array_two   = ['w','b','y','r','v','e','q','z','a','y','t','u','f','d','x','m','k','c','n','j','i','g','h','l','o','p']
		array_three = ['l','u','q','o','r','g','a','j','z','c','h','v','i','y','f','w','k','e','t','p','s','d','x','b','n','m']
		array_four  = ['f','w','k','e','t','o','r','g','a','j','p','s','d','x','b','n','m','l','u','q','z','c','h','v','i','y']
		array_five  = ['h','v','i','y','p','s','d','x','b','n','f','w','k','l','u','q','o','z','c','e','t','m','r','g','a','j']



		#just to simplify it and make everything lowercase
		string = string.downcase

		#encrypted string
		new_string = ""

		#number of crypto arrays
		number_of_arrays = 5

		#split raw string into charcaters
		split_raw = string.split(//)

		#get array index
		hash = Hash[alphabet.map.with_index.to_a]

		#for later to decide which array to use
		array_number = 1

		#to reference each letter in the string
		for letter in split_raw 

			#make sure the character is in the array, e.g. no special chars
			if alphabet.include? letter

				#make sure the hash index is an integer
				number = hash[letter].to_i

				#dont add anything for spaces, easily changed to accomodate spaces
				if letter != " "

					#decide which letter to swap and with what array
					case array_number
						when 1
							new_string = new_string + array_one[number]
							array_number += 1
						next
						when 2
							new_string = new_string + array_two[number]
							array_number += 1
						next
						when 3
							new_string = new_string + array_three[number]
							array_number += 1
						next
						when 4
							new_string = new_string + array_four[number]
							array_number += 1
						next
						when 5
							new_string = new_string + array_five[number]
							array_number = 1
						next
					end
				end
			end
		end

		#print out encrypted string
		puts("\n\n" + new_string + "\n\n")
	end
end

start = Encrypt.new

start.encrypt("Welcome to my world wont you come on in This is lots of fun")

#start.encrypt("Hey there, my name is peter and this is a sample for Buckys room this is pretty sweet")