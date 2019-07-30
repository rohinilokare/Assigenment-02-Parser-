require './javapattern.rb'
require './rubypattern.rb'
require './javascriptpattern.rb'
require './phppattern.rb'

class Parser
	def initialize
		fname1 = "hellojava.txt"
		fname2 = "hellophp.txt"
		fname3 = "hellojavascript.txt"
		fname4 = "helloruby.txt"
		@files=[fname1,fname2,fname3,fname4]
		read_file
	end

	# read file one by one and pass for parsing
	def read_file
		for file in @files
			puts '------------------------------'
			puts 'file is :'+file
			File.open(file)
			@java = JavaPattern.new
			@java.read_files(file)

			@ruby = RubyPattern.new
			@ruby.read_files(file)

			@javascript = JavaScriptPattern.new
			@javascript.read_files(file)

			@php = PhpPattern.new
			@php.read_files(file)
			language_identification
		end
	end

	def language_identification
		if(@java.java_language)
			puts 'language is java'
		elsif(@ruby.ruby_language)
			puts 'language is ruby'
		elsif(@javascript.javascript_language)
			puts 'language is javascript'
		elsif(@php.php_language)
			puts 'language is php'
		end
	end
end
parser = Parser.new
