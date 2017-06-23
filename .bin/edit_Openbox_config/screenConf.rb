#!/bin/ruby
require 'rexml/document'
include REXML


class ScreenConf
    bigSc_width = "1040"
    bigSc_height = "1145"
    smSc_width = "889"
    smSc_height = "694"

    @values = []
    @keys = []
    
    # file = File.open("/home/armin/.config/openbox/rc.xml","r")
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
            "@[class=" => {
                "Xfce4-terminal" => {"]/size/width/" => "1455"},
                # "name" => {"size/width" => "1360"},
                # "anotherName" => {"size/width" => "1360"}
                },
            "@[name=" => {}
        }
    }
    }
    changes.default = "nil"


    def self.stringify_values(obj, string)
        obj.each do |k, v|
            if v.is_a?(Hash)
                stringify_values v, string + k.to_s
            else
                @values.push(string + k.to_s )
                @keys.push(v.to_s)
                return string
            end
        end
    end
    stringify_values(changes, "")

    # puts @values
    # puts @keys

    def self.applyChanges 
        counter = 0
        x, y = `xrandr`.scan(/current (\d+) x (\d+)/).flatten
        if x == '2560' && y == '1440'
            state = 2 # 2560x1440
        else
            state = 3
        end
        begin
            @values.each do |i|
                puts @values[counter]
                puts @doc.root.elements[@values[counter]].text

                if not @doc.root.elements[@values[counter]]
                    raise "Error in #{@arr[i]}"
                end

                @doc.root.elements[@values[counter]].text = @keys[counter]
                puts '##############################'
                puts @doc.root.elements[@values[counter]]

                counter = counter + 1
            end
        rescue Exception => e
            puts "check your data"
            puts e.message
            exit
        end
    end
    applyChanges 

    @doc.write(File.open("/home/armin/.bin/edit_Openbox_config/rc.xml", "w"), 2)

    puts "ScreenConf succeded"
end
