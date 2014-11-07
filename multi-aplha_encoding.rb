class Encrypt
		#arrays with lettes stored		
	$alphabet = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g',
				'h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','<','>','.',',','&','£','+','[',']','{','}',"'",'@','!',
				'"','$','%','^','*','(',')','-','_','=','+','1','2','3','4','5','6','7','8','9','0',' '] 
		$array = []

	def generate_key(key_strength, output_file)
		#generate key is designed so each user can create a unique set of mixed alphabets to increate security.

		for count in 0..key_strength - 1
			#loop through the code to produe ...(key_strength) amount of arrays
			#check if the array is defined

			store = []

			if defined? $array[count] == false
				$array.push(Array.new())
			end

			rand = Random.new
			#loop through every char in $alphabet
			for alpha_char_count in 0..$alphabet.length - 1

				random_number = rand(0..$alphabet.length - 1)
					#generate random letter
				random_letter = $alphabet[random_number.to_i]

					#check if iv already added that random letter to the array else add it
				if $array[count].include?(random_letter)

					#redo the loop to try again
					redo
				else

					#push random char to the array
					$array[count].push(random_letter)
					store.push(random_letter)
					$alphabet.delete(random_letter)
				end
			end

			for letter in store
				$alphabet.push(letter)
			end
		end

		file = File.open(output_file, "w") do |file|

			#loop through each sub-array
			for i in 0..$array.length - 1
				#loop through $array and output them into an array e.g. z,e,t,f...

				file_line = ""

				#loop through chars and build file line
				for count in 0..$alphabet.length - 1
					file_line = file_line + $array[i][count].to_s
				end

				#print file line and reset variable
				file.puts(file_line)
				file_line = ""
			end
		end
	end

	def load_key(input_file)
		#load previous keyfile, allows for decoding messages
		file = File.open(input_file)

		count = 0

		file.each_line{ |file_line|

			line_split = file_line.split("")

			line_split.delete("\n")

			$array.push(line_split)
		}
	end


	def encrypt(string)
		#encrypted string
		new_string = ""

		#number of crypto arrays
		number_of_arrays = 5

		#split raw string into charcaters
		split_raw = string.split("")

		#get array index
		hash = Hash[$alphabet.map.with_index.to_a]

		count = 0

		#loop through each charcater, loop through the number of arrays...
		for letter in split_raw 

			if $alphabet.include? letter

				#make sure the hash index is an integer
				number = hash[letter].to_i
				#dont add anything for spaces, easily changed to accomodate spaces
				
				new_string = new_string + $array[count][number].to_s
					
				count += 1
				if count > $array.length - 1
					count = 0
				end
			end

		end

		#return encoded string
		return new_string
	end

	def decrypt(encrypted_string)
		#allow me to reference each element within each array by its index
		#a bit messy but it does the job

		#split the encoded string
		string_split = encrypted_string.split("")

		array_count = 0

		#new string variable
		new_string = ""

		for letter in string_split

			hash = Hash[$array[array_count].map.with_index.to_a]

			number = hash[letter].to_i

			new_string = new_string + $alphabet[number].to_s

			if array_count >= $array.length - 1
				array_count = 0
			else
				array_count += 1	
			end
		end
		#return the decoded string
		return new_string
	end
end

start = Encrypt.new

#encoded_string = start.encrypt("Welcome to my world wont you come on in This is lots of fun")
#puts(encoded_string)
#puts(start.decode(encoded_string))

start.load_key("key.txt")

encrypted = start.encrypt("Hey there world, this is my own encryption i've been working on. You should all let me know what you think. The key is randomly generated and will sometimes fail, hence the script needs to be run a number of times to be 100%. No need for public encryptions...")
puts("\n\n" + encrypted + "\n\n----------------------------------------------------\n\n")
puts(start.decrypt(encrypted))