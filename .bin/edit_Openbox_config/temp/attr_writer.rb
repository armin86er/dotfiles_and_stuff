#!/usr/bin/env ruby

def make_me_a_setter(thename)
	eval <<-SETTERDONE
	def #{thename}(myarg)
		@#{thename} = myarg
	end
	SETTERDONE
end

class Example
	make_me_a_setter :symboll
	make_me_a_setter "stringg"

	def show_symboll
		puts @symboll
	end

	def show_stringg
		puts @stringg
	end
end

example = Example.new
example.symboll("ITS A SYMBOL")
example.stringg("ITS A STRING")
example.show_symboll
example.show_stringg
