class JavaPattern
	# read all input file
	def read_files(file)
		pattern
		@file = file
		file_line_count
		File.open(@file).each do |line|
				checkLine(line)
		end
		java_language()
	end

	def pattern
		@java_true_count = 0
		@javapatterns = ['public\s+class\s\w*\s\{[^*]+\}',
		'public\sstatic\svoid\smain\(\String\[\]\s\args\)\s{[^*]+\}',
		'System.out.println\(\"[^*]+\"\)\;',
		'System.out.print\(\"[^*]+\"\)\;',
		'class',
		'public',
		'private',
		'protected',
		'default']
	end

	def checkLine(line)
		for pattern in @javapatterns
			java = line.match(pattern)
			if(!line.match(pattern).nil?)
				@java_true_count = @java_true_count + 1
			end
		end
	end

	def file_line_count
			@line_count = `wc -l "#{@file}"`.strip.split(' ')[0].to_i
	end

	def java_language()
		@line_count /= 2
		if(@java_true_count > @line_count)
			return true
		end
	end

end
