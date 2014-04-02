# to run script use command 'ruby file_watch.rb path/to/directory'  
 
 
filetypes = ['css', 'html', 'php', 'rb', 'erb', 'scss', 'js']
watch_folder = ARGV[0]
 
puts "Watching #{watch_folder} and subfolders for changes in project files..."
 
while true do 
  
  files = []
  filetypes.each {|type|
  files += Dir.glob( File.join( watch_folder, "**", "*.#{type}"))}
 
 
  files_timestamps = files.collect {|f| [ f, File.stat(f).mtime.to_i] }
  file_changes ||= files_timestamps
 
  diff_hash = files_timestamps - file_changes
 
  unless diff_hash.empty?
    file_changes = files_timestamps
    puts "you changed a file..."
  end
 
  sleep 1
end
