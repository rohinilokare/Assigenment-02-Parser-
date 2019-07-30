class RubyPattern
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
		@java_true_count = 0
		@java_false_count = 0
		@rubypatterns = ['puts','def\s\\w*\\s\\:']
	end

	def checkLine(line)
		for pattern in @rubypatterns
			java = line.match(pattern)
			if(!line.match(pattern).nil?)
				@java_true_count = @java_true_count + 1
			end
		end
	end

	def file_line_count
			@line_count = `wc -l "#{@file}"`.strip.split(' ')[0].to_i
	end

	def ruby_language()
		# puts @java_true_count
		# puts parser.line_count_hash[@file]
		# parser.line_count_hash[@file] = parser.line_count_hash[@file] / 2
		@line_count /= 2
		if(@java_true_count > @line_count)
			# puts 'language is java'
			# puts '---------------------------------'
			return true
		end

	end

end
