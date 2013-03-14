def enterInfo()
	print "What is your name? "
	name = gets.chomp
	print "What is your age? "
	age = gets.chomp
	print "What is your username? "
	username = gets.chomp
	result = "Your name is " + name + ", you are " + age + " years old, and your username is " + username + "."
	puts result

	# save information to a file named 1_info.txt
	f = File.new('1_info.txt', 'w')
	f.puts(result)
	f.close	
end

if File.file?('1_info.txt')
	print "Enter new info? [y/n] "
	option = gets.chomp
	if option.downcase == 'n'
		f = File.new('1_info.txt')
		f.each do |line|
			puts line
		end
		f.close
	else
		enterInfo
	end
else
	enterInfo
end 
