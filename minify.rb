require 'uglifier'
if ARGV.size < 1
	puts "You must enter a path to the js file"
	puts "Ex. ruby minify.rb C:\\path\\to\\file.js"
	exit
end

dir = ARGV[0].strip.to_s

filename = dir.split('\\')[-1].sub('.', ".min.")
minifiedJS = Uglifier.compile(File.read(dir), :output => {:max_line_len => 32 * 512} )
File.open("minified/#{filename}", 'w') do |file|
	file.puts minifiedJS
end