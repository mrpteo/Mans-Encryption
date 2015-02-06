# encoding: utf-8

class Encrypt

	#global array, contains every charcter which can be encrypted.
	$availiable_charcaters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"," ",",",".","'",'"',"!",";",":","?","@","#","=","+","-","_",")","(","&",'$',"£","*","/","\\","]","[","{","}","~","%","^","<",">","|"]
	
	$generated_key = []

	#encrypt method, passes 2 parameters, second must be integer
	def encrypt(plain_text)

		new_string = ""
		#varify parameter 2 is an integer, if false return.
		

		#splits the plain text and stores every character in an array
		plain_text_character = plain_text.split("")

		#assign each character to the element id, makes it easier to reference
		array_index = Hash[$availiable_charcaters.map.with_index.to_a]
		
		#set the counter variable to 0, allows to loop through each key line
		count = 0

		#loop through the split plain_text_character array 
		for character in plain_text_character

			#check if the character is in the $availiable_characters array
			if $availiable_charcaters.include? (character)

				element_number = array_index[character].to_i
				
				new_string = new_string + $generated_key[count][element_number].to_s

			end

			count += 1

			if count > $generated_key.length - 1

				count = 0

			end

		end

		return new_string

	end

	#decryption method, passed 1 parameter
	def decrypt(encrypted_text)

		#split the encrypted string into an array
		string_split = encrypted_text.split("")

		array_count = 0

		#new string variable
		new_string = ""

		#loop through each character in the string_split array
		for letter in string_split

			hash = Hash[$generated_key[array_count].map.with_index.to_a]

			number = hash[letter].to_i

			new_string = new_string + $availiable_charcaters[number].to_s

			if array_count >= $generated_key.length - 1

				array_count = 0

			else

				array_count += 1	

			end

		end

		#return the decoded string
		return new_string

	end

	#load encryption key method, 1 parameter
	def load_encryption_key(file_location)
		
		file = File.open(file_location)

		count = 0

		file.each_line{ |file_line|

			line_split = file_line.split("")

			line_split.delete("\n")

			$generated_key.push(line_split)
		}
	end

	def generate_encryption_key(output_file_location, encryption_strength)

		loop_count = 0

		for key_generation_count in 0..encryption_strength - 1
			
			#Add a new array to they Key storage aka multi-dimentional
			$generated_key.push(Array.new())

			#loop through each character in the $availiable_characters array to build the unique key.
			while loop_count < $availiable_charcaters.length
				
				#generate the random number which will be used to get the "letter"
				random_number = Random.new
				
				random_element_number = random_number.rand(0..$availiable_charcaters.length - 1)
				
				#push the random letter to the key array
				if !$generated_key[key_generation_count].include?($availiable_charcaters[random_element_number])
					
					#if the character has not been entered into the generate_key array it will add it aka push()
					$generated_key[key_generation_count].push($availiable_charcaters[random_element_number])
					
					#increment loop character
					loop_count += 1
				else
					
					#redo the current loop.
					redo

				end
			end	

			#reset the loop count variable to populate the multiple arrays(depending on the key strength)
			if loop_count >= $availiable_charcaters.length

				loop_count = 0
			
			end

		end

		output_key_file = File.open(output_file_location, "w") do |file|

			for i in 0..$generated_key.length - 1

				file_line = ""

				#loop through chars and build file line
				for count in 0..$availiable_charcaters.length - 1

					#create the file line from each arrat element
					file_line = file_line + $generated_key[i][count].to_s
				end

				#print file line and reset variable
				file.puts(file_line)

				#reset the file_line variable
				file_line = ""

			end

		end

	end

end