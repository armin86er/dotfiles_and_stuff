#!/bin/ruby
require 'rexml/document'
include REXML

class ScreenConf

    @values = []
    @keys = []
    @x, @y = `xrandr`.scan(/current (\d+) x (\d+)/).flatten
    if @x == '2560' && @y == '1440'
        @state = 1
    else
        @state = 0
    end

    b_width = (@x.to_i - 220-240).to_s
    b_widthHalbe = (@x.to_i/2 - 240-10).to_s
    s_width = "889"
    b_posXl = ( 220).to_s
    b_posXr = ( 220 + 10 + b_widthHalbe.to_i).to_s
    s_posX = 0

    file = File.new("/home/armin/.config/openbox/rc.xml", "r")
    @doc = Document.new(file)

    changes = {
        "applications" => {
            "/application" => {
                "[@class=" => {
                    "'Xfce4-terminal']" => {
                            "/size/width" =>  [ s_width, b_width ], 
                            "/maximized" => ["true", "vertical"]},
                    "'Atom']" => { 
                            "/size/width" => [ s_width, b_width ],
                            "/maximized" => ["true", "vertical"],
                            "/decor" => ["no", "yes"] },
                    "'Thunar']" => { 
                            "/size/width" => [s_width, b_widthHalbe ],
                            "/maximized" => ["true", "false"],
                            "/position/x" => [s_posX, b_posXl],
                            "/decor" => ["no", "yes"] },
                    "'Anki']" => {
                            "/size/width" => [s_width, b_widthHalbe ],
                            "/maximized" => ["true", "false"],
                            "/position/x" => [s_posX, b_posXr],
                            "/decor" => ["no", "yes"] },
                    "'Engrampa']" => {
                            "/size/width" => [s_width, b_widthHalbe ],
                            "/maximized" => ["true", "false"],
                            "/position/x" => [s_posX, b_posXr],
                            "/decor" => ["no", "yes"] },
                    "'Sakura']" => {
                            "/size/width" => ["380", "660" ],
                            "/position/x" => [(@x.to_i - 380).to_s, (@x.to_i - 660).to_s],
                            "/decor" => ["no", "yes"] },
                    "'Baobab']" => {
                            "/size/width" => [s_width, b_width ],
                            "/maximized" => ["true", "vertical"]}
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
                @keys.push(v.to_a)
            end
        end
    end
    stringify_values(changes, "")

    def self.applyChanges 
        counter = 0
        @values.each do |i|
            begin
                puts i
                puts @keys[counter][@state]

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

    @doc.write(File.open("/home/armin/.config/openbox/rc.xml", "w"), 2)

    puts "ScreenConf succeded"
end
