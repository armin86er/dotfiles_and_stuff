#!/bin/ruby
require 'rexml/document'
include REXML

class ScreenConf
    bigSc_width = "1040"
    bigSc_height = "1145"
    smSc_width = "889"
    smSc_height = "694"
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
        ["Baobab", "decor", "yes", "no" ],
        ["libreoffice-startcenter", "decor", "yes", "no" ]
    ]

    def applyChanges changes, doc
        puts "blads"
        x, y = `xrandr`.scan(/current (\d+) x (\d+)/).flatten
        if x == '2560' && y == '1440'
            state = 2 # 2560x1440
        else
            state = 3
        end
        puts changes.length
        changes.length.times do |i|
            puts doc.root.elements["applications/application[@class='#{changes[i][0]}']/#{changes[i][1]}"].text = changes[i][state]
            doc.root.elements["applications/application[@class='#{changes[i][0]}']/#{changes[i][1]}"].text = changes[i][state]
        end
    end

    file = File.new("/home/armin/.config/openbox/rc.xml","r")
    # file = File.new("/home/armin/.bin/edit_Openbox_config/rc.xml","r")
    doc = Document.new(file)

    applyChanges changes, doc
    doc.write(File.open("/home/armin/.bin/edit_Openbox_config/rc.xml","w"), 2)
    # doc.write(File.open("/home/armin/.config/openbox/rc.xml","w"), 2)

    puts "bla"
end
