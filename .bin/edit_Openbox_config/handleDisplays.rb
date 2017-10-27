#!/bin/ruby

class HandleDisplays

  xRandrOutput = %x{xrandr --query}
  xRandrOutput = xRandrOutput.split(/\r?\n/) # Split content by lines
  @DP1         = false
  @DP2         = false
  @eDP1        = true


  xRandrOutput.each do |j|
    if j[" connected"]
      if j.match(/\bDP1\b/)
        @DP1 = true
        # puts 'DP1 true'
      elsif j.match(/\bDP2\b/)
        @DP2 = true
        # puts 'DP2 true'
      elsif j.match(/\beDP1\b/)
        # puts 'eDP1 true'
      end
    end
  end

	if `hostname` == 'archspell'
		if @DP1
			# puts '##Case1'
			`xrandr --output DP1 --auto --primary & xrandr --output eDP1 --off & xrandr --output DP2 --off`
		elsif @DP2 && !@DP1
			# puts '##Case2'
			`xrandr --output DP2 --auto --primary & xrandr --output eDP1 --off & xrandr --output DP1 --off`
		else
			# puts '##Case3'
			`xrandr --output eDP1 --auto --primary & xrandr --output DP1 --off & xrandr --output DP2 --off`
		end
	else
	end
end

