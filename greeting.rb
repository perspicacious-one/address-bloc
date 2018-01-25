def greeting
  ARGV.slice(1, ARGV.length).each do |arg|
    puts "#{ARGV[0]}, #{arg}!"
  end
end

greeting
