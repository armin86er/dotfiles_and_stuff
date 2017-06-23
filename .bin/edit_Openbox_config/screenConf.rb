#!/bin/ruby
require 'rexml/document'
require 'yaml'
include REXML


class ScreenConf
  bigSc_width = "1040"
  bigSc_height = "1145"
  smSc_width = "889"
  smSc_height = "694"
  @i = 0
  # @add = ""
  @arr = []

  changes2 = {"applications" => {
      "/application" => {
          "@[class=" => {
              "Xfce4-terminal" => {"]size/width" => "135560"},
              "name" => {"size/width" => "1360"},
              "anotherName" => {"size/width" => "1360"}},
          "@[name=" => {
              "_Xfce4-terminal" => {"]size/width" => "135560", "magictag" => "valueofM"},
              "_name" => {"size/width" => "1360"},
              "_anotherName" => {"size/width" => "1360"}
          }
      }
  }
  }
  changes2.default = "nil"


  def self.stringify_values(obj, string)
    obj.each do |k, v|
      if v.is_a?(Hash)
        stringify_values v, string + k.to_s
      else
        @arr.push(string + k.to_s + v.to_s)
        return string
      end
    end
    puts '----------'
    puts string
    puts obj.to_s
    puts '----------'
    # (0..obj.length).each do |i|
    #   if obj[i]
    #     stringify_values(obj[i], string)
    #   end
    # end
  end

  stringify_values(changes2, "")
  puts @arr

  changes = [
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
  file = File.new("/home/armin/.bin/edit_Openbox_config/rc.xml", "r")
  doc = Document.new(file)

  applyChanges changes, doc
  # doc.write(File.open("/home/armin/.bin/edit_Openbox_config/rc.xml","w"), 2)
  doc.write(File.open("/home/armin/.config/openbox/rc.xml", "w"), 2)

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
