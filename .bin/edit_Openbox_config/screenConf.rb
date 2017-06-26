#!/bin/ruby
require 'rexml/document'
include REXML


class ScreenConf
    bigSc_width = 1040
    bigSc_height = "1145"
    smSc_width = 889
    smSc_height = "694"


    @values = []
    @keys = []
    @x, @y = `xrandr`.scan(/current (\d+) x (\d+)/).flatten
    if @x == '2560' && @y == '1440'
        @state = 1
    else
        @state = 0
    end
    @t = ["first","second","third"]

    # offset = (@x.to_i - 500).to_s
    
    def self.calc mode
        # case mode
        # when "fullSize"
            # puts 'gotcha'
        # when "yMax_xCen"
        # when "yMax_xHalf_small"
        # when "yMax_xHalf_big"
        # end
    end

    file = File.new("/home/armin/.bin/edit_Openbox_config/rc.xml", "r")
    @doc = Document.new(file)

    @changes = [
        ["Xfce4-terminal", "size/width", "2100", smSc_width],
        ["Atom", "size/width", "2100", smSc_width],
        ["Atom", "size/width", bigSc_width, smSc_width],
        ["Atom", "size/height", bigSc_height, smSc_height],
        ["Atom", "decor", "yes", "no"],
        ["Thunar", "size/width", bigSc_width, smSc_width],
        ["Thunar", "size/height", bigSc_height, smSc_height],
        ["Thunar", "decor", "yes", "no"],
        ["Engrampa", "size/width", bigSc_width, smSc_width],
        ["Engrampa", "size/height", bigSc_height, smSc_height],
        ["Engrampa", "decor", "yes", "no"],
        ["Baobab", "size/width", bigSc_width, smSc_width],
        ["Baobab", "size/height", bigSc_height, smSc_height],
        # ["Baobab", "decor", "yes", "no" ],
        ["libreoffice-startcenter", "decor", "yes", "no"]
    ]

    changes = {"applications" => {
        "/application" => {
            "[@class=" => {
                # "'Xfce4-terminal']" => {"/size/width" => Array.new( smSc_width, bigSc_width ), "/maximized" => ["true", "vertical"]},
                "'Atom']" => {  "/size/width" => ["true", "vertical"], "/maximized" => ["true", "vertical"], "/decor" => ["no", "yes"] },
                # "'Thunar']" => {  "/size/width" => [smSc_width, bigSc_width ], "/maximized" => ["true", "vertical"], "/decor" => ["no", "yes"] },

            },
            "@[name=" => {}
        }
    }}
    changes.default = "nil"

    def self.stringify_values(obj, string)
        obj.each do |k, v|
            if v.is_a?(Hash)
                stringify_values v, string + k.to_s
            else
                @values.push(string + k.to_s )
                @keys.push(v.to_s)
            end
        end
    end
    stringify_values(changes, "")

    def self.applyChanges 
        counter = 0
        @values.each do |i|
            begin
				puts i
                puts @keys[counter][0]

                if not @doc.root.elements[@values[counter]]
                    raise "Error in #{@arr[i]}"
                end

                @doc.root.elements[i].text = @keys[counter][@state]

                counter += 1
            rescue Exception => e
                puts "check your data in \n#{i}"
                puts e.message
                exit
            end
        end
    end
    applyChanges 

    @doc.write(File.open("/home/armin/.bin/edit_Openbox_config/rc.xml", "w"), 2)

    puts "ScreenConf succeded"
end
