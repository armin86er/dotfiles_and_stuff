#!/usr/bin/ruby

@dir = '/home/armin/Documents/Tutorials/'
Dir.chdir(@dir)
@list = `ls`
@list = @list.split(/\r?\n/) # Split content by lines


def initProcess()
    @file = { :dir => [], :name => [], :pdf => [] }
    collectFiles
    system("clear")
    printContent
    puts "\nWhich cheatsheet?"
    select = gets.chomp
    startApp select
end

def collectFiles
    @list.each do |i|
        subfolder = @dir + i
        if File.exist? "#{subfolder}/cheatsheet.md"
            @file[:dir].push( "#{subfolder}/cheatsheet")
            @file[:name].push(i)
            if File.exist? "#{subfolder}/cheatsheet.pdf"
                @file[:pdf].push(true)
            else
                @file[:pdf].push(false)
            end
        end
    end
end

def startApp select
    if select[0] == 'e'
        sizeOld = (File.size(@file[:dir][select[1].to_i].to_s + '.md').to_f)
        system("vim #{@file[:dir][select[1].to_i]}.md")
        sizeNew = (File.size(@file[:dir][select[1].to_i].to_s + '.md').to_f)
        if sizeOld != sizeNew
            puts "Compiling Markdown..."
            system("pandoc -s #{@file[:dir][select[1].to_i]}.md -o #{@file[:dir][select[1].to_i]}.pdf")
        end
    elsif @file[:pdf][select.to_i] == true
        system("clear")
        # puts "Cheatseet " + @file[:name][select.to_i] + " is running"
        system("atril #{@file[:dir][select.to_i]}.pdf > /dev/null 2> /dev/null")
    else
        puts "dirty Input"
        sleep 2
    end
    initProcess
end

def printContent
    counter = 0
    content = []
    @file[:name].each do |i|
        if counter % 3 == 0 && counter != 0
            content.push("\n")
        end
        space = content.length
        content.push(counter.to_s)
        content.push(") ") 
        if @file[:pdf][counter] == true
            content.push("*")
        end
        counter += 1 
        i.split("").each do |j|
            content.push(j)
        end
        # content.push(i)
        if counter % 3 != 0
            while content.length-space < 14 
                content.push(" ") 
            end
        end
    end
    print content.join
end

initProcess
