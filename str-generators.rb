class String
	def self.randomkey(setup)
		includes = "aA1"
		length = 16
		repeat = 1
		separator = ""
		digits = "0123456789"
		small = "abcdefghijklmnopqrstuvwxyz"
		caps = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		chars = ""
		
		if setup[:includes] != nil then includes = setup[:includes].to_s end
		if setup[:length] != nil then length = setup[:length].to_s.to_i end
		if setup[:repeat] != nil then repeat = setup[:repeat].to_s.to_i end
		if setup[:separator] != nil then separator = setup[:separator].to_s end
		
		#eval includes
		includes.each_char do |char|
			if digits.include? char then chars += digits end
			if small.include? char then chars += small end
			if caps.include? char then chars += caps end
		end
		
		result = []
		(1..repeat).each do
			block = ""
			(1..length).each do
				block += chars[rand(0..chars.size-1)]
			end
			result << block
		end
		return result.join separator
	end

	def self.randomkeys(num, setup)
		result = {}
		while result.size < num
			result[self.randomkey(setup)] = 0
		end
		return result.keys
	end
	
	def self.char_ruler(width, filler = " ")
		tens = ""
		ones = ""
		(1..width).each do |index|
			if (index % 10 == 0) or (index == 1) or (index == width)
				tens << ((index/10) % 10).to_s
			else
				tens << filler
			end
			ones << (index % 10).to_s
		end
		[tens, ones].join("\n")
	end
end
