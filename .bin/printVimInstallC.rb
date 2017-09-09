#!/bin/usr/ruby

file = File.read('/home/armin/.tmp/pacinVim.txt')
res = "yaourt -Syu "
file.split("\n").each do |i|
  res += i + "\t \\ \n"
end
puts res
