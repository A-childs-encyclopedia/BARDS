def find_and_change_dir(target_name, root_path = "C:/")
  matches = Dir.glob(File.join(root_path, "**", target_name))
  found_path = matches.find { |path| File.directory?(path) && File.basename(path) == target_name }

  unless found_path
    puts "#{target_name} not found under #{root_path}"
    return
  end

  begin
    # Change to target directory
    Dir.cd(found_path)
    puts "Changed to: #{found_path}"

    # Create devmode.txt
    File.write("devmode.txt", "")
    puts "Successfully created devmode.txt"

    # Create games directory
    Dir.mkdir("games")
    puts "Successfully made games"

    # Create BAR.sdd inside games
    Dir.cd("games")
    Dir.mkdir("BAR.sdd")
    puts "Successfully made BAR.sdd"

    # Clone repository into BAR.sdd
    Dir.cd("BAR.sdd")
    Process.run(
      "git",
      ["clone", "https://github.com/beyond-all-reason/Beyond-All-Reason.git", "--progress", "."],
      output: Process::Redirect::Inherit,
      error: Process::Redirect::Inherit
    )
    puts "Dev environment fully setup :)"
  rescue e
    puts "An error occurred: #{e.message}"
  end
end

find_and_change_dir("Beyond-All-Reason", "C:/")