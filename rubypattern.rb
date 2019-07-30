class RubyPattern
	# read all input file
	def read_files(file)
		pattern
		@file = file
		file_line_count
		File.open(@file).each do |line|
			checkLine(line)
		end
		ruby_language()
	end

	def pattern
		@ruby_true_count = 0
		@rubypatterns = ['puts','def\s\\w*\\s\\:']
	end

	def checkLine(line)
		for pattern in @rubypatterns
			java = line.match(pattern)
			if(!line.match(pattern).nil?)
				@ruby_true_count = @ruby_true_count + 1
			end
		end
	end

	def file_line_count
			@line_count = `wc -l "#{@file}"`.strip.split(' ')[0].to_i
	end

	def ruby_language()
		@line_count /= 2
		if(@ruby_true_count > @line_count)
			return true
		end
	end

end
