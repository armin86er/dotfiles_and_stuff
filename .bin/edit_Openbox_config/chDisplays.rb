#!/bin/ruby

class HandleDisplays
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

    print "# connected displays -> #{displays}"

    if status
        `xrandr --output DP1 --auto && xrandr --output eDP1 --off`
    else
        `xrandr --output eDP1 --auto && xrandr --output DP1 --off`
    end
end

