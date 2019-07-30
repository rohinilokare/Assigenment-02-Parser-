class PhpPattern
	# read all input file
	def read_files(file)
		pattern
		@file = file
		file_line_count
		File.open(@file).each do |line|
				checkLine(line)
		end
		php_language()
	end

	def pattern
		@php_true_count = 0
		@phppatterns = ['<\?php','echo']
	end

	def checkLine(line)
		for pattern in @phppatterns
			java = line.match(pattern)
			if(!line.match(pattern).nil?)
				@php_true_count = @php_true_count + 1
			end
		end
	end

	def file_line_count
		@line_count = `wc -l "#{@file}"`.strip.split(' ')[0].to_i
	end

	def php_language()
		@line_count /= 2
		if(@php_true_count > @line_count)
			return true
		end
	end

end
