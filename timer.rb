require 'pry'

puts "how long?"
length_response = gets.chomp

number = length_response.split(" ").first.to_i
segment = length_response.split(" ").last



binding.pry
puts "what message?"
message = gets.chomp
puts "enter a title here if you want one,"
puts "otherwise, just hit enter"
title = gets.chomp

if title == ""
  system("sleep #{duration} && terminal-notifier -message '#{message}' & disown && exit")
else
  system("sleep #{duration} && terminal-notifier -message '#{message}' -title '#{title}' & disown && exit")
end