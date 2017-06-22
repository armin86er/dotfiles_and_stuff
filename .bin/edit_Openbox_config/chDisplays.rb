#!/bin/ruby

def handleDisplays
    xRandrOutput = %x{xrandr --query}

    xRandrOutput = xRandrOutput.split(/\r?\n/) # Split content by lines
    displays = []
    status = nil

    xRandrOutput.each do |i|
        if i[" connected"]
            displays.push(i.split(" ")[0])
            if displays[displays.length - 1].match(/\bDP1\b/)
                status =  displays[displays.length - 1]
            end
        end
    end

    puts "# connected displays"
    puts displays

    if status
        exec ('xrandr --output DP1 --auto && xrandr --output eDP1 --off')
    else
        exec ('xrandr --output eDP1 --auto && xrandr --output DP1 --off')
    end
end

