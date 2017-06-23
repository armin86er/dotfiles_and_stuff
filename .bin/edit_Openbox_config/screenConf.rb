#!/bin/ruby
require 'rexml/document'
include REXML

class ScreenConf
    bigSc_width = "1040"
    bigSc_height = "1145"
    smSc_width = "889"
    smSc_height = "694"
    @i = 0
    @add = ""
    @arr = []

    changes2 = {"applications" => {
        "/application"=> {
            "@[class=" => {
                "Xfce4-terminal" => { "]size/width" => "135560" },
                "name" => {  "size/width" => "1360"  },
                "anotherName" => {   "size/width" => "1360"   }}
        }
    }
    }
    changes2.default = "nil"

    def self.hashProcessing hashy 
        begin
            if hashy
                hashy.each { |key, value| 
                    # puts hashy.keys
                    if value.is_a?(Hash)
                        # print "Laenge: ", value.length,"  key: ", key, "\n"
                        # print "  ", hashy.length, "   "
                        # print key
                        if hashy.length == 1
                            @add = @add + key
                        else
                            # if value.is_a?(Hash)
                                # (1..k)
                                # print @add, key, "\n"
                            # elsif value.is_a?(String)
                            # end
                        end
                        hashProcessing hashy[ hashy.keys[@i] ]
                    else
                        # print key ,value, "\n"
                    end
                }
            end
        rescue
            puts "\nresc"
            @i = @i + 1
        end
    end
    hashProcessing changes2

    # def self.hashProcessing hashy
    #     begin
    #         puts '-------------'
    #         puts hashy.length
    #         # puts hashy.keys[0]
    #         if hashy
    #             hashy.each { |key, value|
    #                 puts @i
    #                 puts hashy.keys
    #                 hashProcessing hashy[ hashy.keys[@i] ] }
    #         end
    #         # hashProcessing hashy[ hashy.keys[0] ]
    #     rescue
    #         puts "\nresc"
    #         @i = @i + 1
    #     end
    # end
    # hashProcessing changes2

    changes = [
        ["Xfce4-terminal", "size/width", "2100",smSc_width],
        ["Atom", "size/width", "2100",smSc_width],
        ["Atom", "size/width", bigSc_width,smSc_width],
        ["Atom", "size/height", bigSc_height, smSc_height],
        ["Atom", "decor", "yes", "no" ],
        ["Thunar", "size/width", bigSc_width,smSc_width],
        ["Thunar", "size/height", bigSc_height, smSc_height],
        ["Thunar", "decor", "yes", "no" ],
        ["Engrampa", "size/width", bigSc_width,smSc_width],
        ["Engrampa", "size/height", bigSc_height, smSc_height],
        ["Engrampa", "decor", "yes", "no" ],
        ["Baobab", "size/width", bigSc_width,smSc_width],
        ["Baobab", "size/height", bigSc_height, smSc_height],
        # ["Baobab", "decor", "yes", "no" ],
        ["libreoffice-startcenter", "decor", "yes", "no" ]
    ]

    def self.applyChanges changes, doc
        x, y = `xrandr`.scan(/current (\d+) x (\d+)/).flatten
        if x == '2560' && y == '1440'
            state = 2 # 2560x1440
        else
            state = 3
        end
        changes.length.times do |i|
            begin
                doc.root.elements["applications/application[@class='#{changes[i][0]}']/#{changes[i][1]}"].text = changes[i][state]
                doc.root.elements["applications/application[@class='#{changes[i][0]}']/#{changes[i][1]}"].text = changes[i][state]
            rescue
                puts "Error in #{i}"
            end
        end
    end

    # # file = File.open("/home/armin/.config/openbox/rc.xml","r")
    file = File.new("/home/armin/.bin/edit_Openbox_config/rc.xml","r")
    doc = Document.new(file)

    applyChanges changes, doc
    # doc.write(File.open("/home/armin/.bin/edit_Openbox_config/rc.xml","w"), 2)
    doc.write(File.open("/home/armin/.config/openbox/rc.xml","w"), 2)

    puts "ScreenConf succeded"

    # applications = Proc.new do
    # application = Proc.new do
    # puts 'got it'
    # end
    # end
    #
    # def self.exe procy
    # procy.call
    # end
    #
    # test = exe applications
    # exe test
end
