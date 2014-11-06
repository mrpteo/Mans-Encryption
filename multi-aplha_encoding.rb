class Encrypt
		#arrays with lettes stored		
		$alphabet    = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' '] 

		$array_one   = ['z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a']
		$array_two   = ['w','b','y','r','v','e','q','z','a','y','t','u','f','d','x','m','k','c','n','j','i','g','h','l','o','p']
		$array_three = ['l','u','q','o','r','g','a','j','z','c','h','v','i','y','f','w','k','e','t','p','s','d','x','b','n','m']
		$array_four  = ['f','w','k','e','t','o','r','g','a','j','p','s','d','x','b','n','m','l','u','q','z','c','h','v','i','y']
		$array_five  = ['h','v','i','y','p','s','d','x','b','n','f','w','k','l','u','q','o','z','c','e','t','m','r','g','a','j']

		$array = []

	def generate_key(key_strength, output_file)
		#generate key is designed so each user can create a unique set of mixed alphabets to increate security.

		random_number = Random.new

		#next job!

	end

	def load_key(input_file)
		#load previous keyfile, allows for decoding messages

	end


	def encrypt(string)
		#just to simplify it and make everything lowercase
		string = string.downcase

		#encrypted string
		new_string = ""

		#number of crypto arrays
		number_of_arrays = 5

		#split raw string into charcaters
		split_raw = string.split("")

		#get array index
		hash = Hash[$alphabet.map.with_index.to_a]

		#for later to decide which array to use
		array_number = 1

		#to reference each letter in the string
		for letter in split_raw 

			#make sure the character is in the array, e.g. no special chars
			if $alphabet.include? letter

				#make sure the hash index is an integer
				number = hash[letter].to_i

				#dont add anything for spaces, easily changed to accomodate spaces
				if letter != " "
					#decide which letter to swap and with what array
					case array_number
						when 1
							new_string = new_string + $array_one[number]
							array_number += 1
						next
						when 2
							new_string = new_string + $array_two[number]
							array_number += 1
						next
						when 3
							new_string = new_string + $array_three[number]
							array_number += 1
						next
						when 4
							new_string = new_string + $array_four[number]
							array_number += 1
						next
						when 5
							new_string = new_string + $array_five[number]
							array_number = 1
						next
					end
				else
					new_string = new_string + "1"
				end
			end
		end

		#return encoded string
		return new_string
	end

	def decode(encoded_string)
		#allow me to reference each element within each array by its index
		#a bit messy but it does the job
		hash1 = Hash[$array_one.map.with_index.to_a]
		hash2 = Hash[$array_two.map.with_index.to_a]
		hash3 = Hash[$array_three.map.with_index.to_a]
		hash4 = Hash[$array_four.map.with_index.to_a]
		hash5 = Hash[$array_five.map.with_index.to_a]

		#split the encoded string
		string_split = encoded_string.split("")

		#array selector
		array_number = 1

		#new string variable
		new_string = ""

		#for loop to reference each character
		for letter in string_split

			#check for spaces
			if letter != "1"

				#get index number of each character
				number1 = hash1[letter].to_i	
				number2 = hash2[letter].to_i
				number3 = hash3[letter].to_i
				number4 = hash4[letter].to_i
				number5 = hash5[letter].to_i

				#decide which array to use
				case array_number
					when 1
						new_string = new_string + $alphabet[number1]
						array_number += 1
					next
					when 2
						new_string = new_string + $alphabet[number2]
						array_number += 1
					next
					when 3
						new_string = new_string + $alphabet[number3]
						array_number += 1
					next
					when 4
						new_string = new_string + $alphabet[number4]
						array_number += 1
					next
					when 5
						new_string = new_string + $alphabet[number5]
						array_number = 1
					next
				end
			else
				#reenter spaces into ou text
				new_string = new_string + " "
			end
		end

		#return the decoded string
		return new_string
	end
end