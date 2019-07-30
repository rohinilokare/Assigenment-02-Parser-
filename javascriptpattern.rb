class JavaScriptPattern
	# read all input file
	def read_files(file)
		pattern
		@file = file
		file_line_count
		File.open(@file).each do |line|
				checkLine(line)
		end
		javascript_language()
	end

	def pattern
		@javascript_true_count = 0
		@javascriptpatterns = ['function\\s*\\w*()','document.getElementById(\"\w*\").value\s*\=\'\s*\w*\s*\'\;','document.getElementById']
	end

	def checkLine(line)
		for pattern in @javascriptpatterns
			java = line.match(pattern)
			if(!line.match(pattern).nil?)
				@javascript_true_count = @javascript_true_count + 1
			end
		end
	end

	def file_line_count
			@line_count = `wc -l "#{@file}"`.strip.split(' ')[0].to_i
	end

	def javascript_language()
		@line_count /= 2
		if(@javascript_true_count > @line_count)
			return true
		end
	end

end
