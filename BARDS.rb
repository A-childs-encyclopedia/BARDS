require 'find'

def find_and_change_dir(target_name, root_path = "C:/")
  Find.find(root_path) do |path|
    if File.basename(path) == target_name && File.directory?(path)
      Dir.chdir(path)
      puts "Changed to: #{path}"
      return
    end
  rescue => e
    puts "Error accessing #{path}: #{e}"
  end
  puts "#{target_name} not found under #{root_path}"
end

# Example usage
find_and_change_dir("Beyond-All-Reason", "C:/")