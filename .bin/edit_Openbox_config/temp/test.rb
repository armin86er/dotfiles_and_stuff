#!/bin/ruby

identity = Hash.new { |hash, key| key  }
identity[:a] = 1
puts identity[:a] #=> 1
puts identity[:b] #=> :b
identity[:b] = 2
puts identity[:b] #=> :b
puts identity.keys
puts identity.values

# $, = ", "
# months = Hash.new(0)

            # months = { "applications" => {
            #     "application"=> {
            #         "class" => {
            #             "Xfce4-terminal" => {
            #                 "size/width" => "1360" },
            #                 "name" => {
            #
            #                 }
            #         }
            #     }
            # }}
            # months.default = 0
            #
            # keys = months.values
            #
            # # puts "#{keys}"
            # puts months["1"]
            # puts months["4"]
            #
            # months["applications"]["application"].each_key { |value| puts value }

# class Test
# def bla
# puts "bla"
# end
#
# def self.blu
# puts 'blu'
# end
# blu
# end
#
# Test.new.bla
# Test.new
