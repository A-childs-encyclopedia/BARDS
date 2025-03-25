require 'find'

def find_and_change_dir(target_name, root_path = "C:/")
  Find.find(root_path) do |path|
    if File.basename(path) == target_name && File.directory?(path)
      Dir.chdir(path)
      puts "Changed to: #{path}"
      File.new("/devmode.txt")
      puts "Successfully created devmode.txt"
      Dir.mkdir("/games")
      puts "Successfully made \\games"
      Dir.chdir("/games")
      Dir.mkdir("/BAR.sdd")
      puts "Successfully made \\BAR.sdd"
      Dir.chdir("/BAR.sdd")
      Process.spawn "git clone https://github.com/beyond-all-reason/Beyond-All-Reason.git --progress ."
      puts "Dev environment fully setup :)"
      return
    end
  rescue => e
    puts "Error accessing #{path}: #{e}"
  end
  puts "#{target_name} not found under #{root_path}"
end

find_and_change_dir("Beyond-All-Reason", "C:/")